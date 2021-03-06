require 'socket'
require 'json'

server = TCPServer.open('localhost', 3000)

loop do
  Thread.start(server.accept) do |session|
    request = session.read_nonblock(256)
    header, body = request.split("\r\n\r\n", 2)
    header = header.split(' ')
    method = header[0].chomp
    path = header[1][1..-1].chomp

    if File.exist?(path)
        file = File.read(path)
        session.print("HTTP/1.0 200 OK\r\nDate:#{Time.now.ctime}\r\nContent-Type: text/html\r\nContent-Size:#{file.size}\r\n\r\n")
      if method == "GET"
        session.print file

      elsif method == "POST"
        params = JSON.parse(body)
        user_data = "<li>name: #{params[:viking][:name]}</li><li>E-mail: #{params[:viking][:email]}</li>"
        session.puts file.gsub('<%= yield %>', user_data)
      end

    else
      session.print("HTTP/1.0 404 File Not Found\r\n")
    end
  session.close
  end
    end
