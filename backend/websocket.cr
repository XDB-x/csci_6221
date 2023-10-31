require "http/web_socket"

PORT = 9000

class Client
    property socket: TCPSocket

    def initialize(@socket)
    end

    def send(message, cmd)
        socket.send ({message: message, cmd: cmd}).json
    end 
end

class Server 
    property Users = Array(Client).new

    def handle_connection(socket)
        pp"New connection: #{socket}"

        temp_client = Client.new(socket)
        client << temp_client

        loop do
            new_message = socket.gets

            clients.each do |obj|
                obj.send new_message, "CHAT"
            end
        end

    rescue e
        clients.delete temp_client
        pp "#{temp_client} has disconnected"

    def initialize
        pp "server is listening to new connections on #{PORT}..."

        server = TCPServer.new(PORT)

        while socket = server.accept?
            spawn handle_connection(socket)
        end
    end
end

