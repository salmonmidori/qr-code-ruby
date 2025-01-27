require "rqrcode"
require "dotenv/load"

loop do
  puts "What type of QR code would you like to generate? Input the integer corresponding to your desired type.
  1: URL
  2: Wifi network
  3: Text message
  
  Or enter 99 to quit."

  qr_type = gets.chomp.to_i
  if qr_type == 99
    break
  elsif qr_type == 1
    puts "Input URL:"
    qr_message = gets.chomp
  elsif qr_type == 2
    puts "Input wifi network name:"
    wifi_name = gets.chomp
    puts "Input wifi password:"
    wifi_pass = gets.chomp
    qr_message = "WIFI:T:WPA;S:#{wifi_name};P:#{wifi_pass};;"
  elsif qr_type == 3
    puts "Input recipient's phone number:"
    phone = gets.chomp
    puts "Input message contents:"
    text = gets.chomp
    qr_message = "SMSTO:#{phone}:#{text}"
  else
    puts "Invalid entry. Please try again."
    exit
  end

  puts "What would you like to name the output? (If left blank, it will be called qrcode.png)"
  filename = gets.chomp
  if filename == "" 
    filename = "qrcode"
  end
  png = RQRCode::QRCode.new(qr_message).as_png({ :size => 500 }).to_s
  IO.binwrite(filename, png)

  puts "File generated! Returning to main menu..."
end
