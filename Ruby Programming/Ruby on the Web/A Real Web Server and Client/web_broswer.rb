require 'socket'
require 'json'

host = 'localhost'
port = 3000

puts "Welcome to Simple Browser.\nType GET to retrieve a webpage or POST to submit one."
input = gets.chomp

if input == "GET"
  path = '/index.html'
  request = "GET #{path} HTTP/1.0\r\n\r\n"

elsif input == "POST"
  puts "Enter your name"
  name = gets.chomp
  puts "Enter your email"
  email = gets.chomp

  users = {:viking => {:name => name, :email => email}}.to_json

  path = '/thanks.html'
  request = "POST #{path} HTTP/1.0\r\nFrom: #{email}\r\nUser-Agent: Simple Web Browser\r\nContent=Type: application/json\r\nContent-Size: #{users.size}\r\n\r\n#{users}"

else
  puts "Unrecognized input."
  exit(0)
end

socket = TCPSocket.open(host, port)
socket.print(request)

while response = socket.gets
  puts response
end

