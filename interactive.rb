require "rqrcode"
require "dotenv/load"

message = "you are cute"
wifi = "WIFI:T:WPA;S:My wifi network;P:supersecretpassword;;"
url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"

text_template = "SMSTO:#{ENV["PHONE_NUMBER"]}:Hey Amy, I'm done getting the China insurance!"

png = RQRCode::QRCode.new(text_template).as_png({ :size => 500 }).to_s
IO.binwrite("qrcode.png", png)
