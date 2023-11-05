require "kemal"

logging false
serve_static false

SOCKETS = [] of HTTP::WebSocket

get "/chat" do
  render "views/index.ecr"
end

# Add these lines to your existing code
get "/signup" do
  render "views/signup.ecr"
end

post "/signup" do |env|
  username = env.params.body["username"]
  password = env.params.body["password"]
  # ... handle signup ...
  env.redirect "/login"
end

get "/login" do
  render "views/login.ecr"
end

post "/login" do |env|
  username = env.params.body["username"]
  password = env.params.body["password"]
  # ... handle login ...
  env.redirect "/chat"
end

ws "/chat" do |socket|
  # Add the client to SOCKETS list
  SOCKETS << socket

  # Broadcast each message to all clients
  socket.on_message do |message|
    SOCKETS.each { |socket| socket.send message}
  end

  # Remove clients from the list when it's closed
  socket.on_close do
    SOCKETS.delete socket
  end
end

Kemal.run