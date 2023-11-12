require "kemal"
require "sqlite3"
require "db"
require "kemal-session"

Kemal::Session.config do |config|
  config.secret = "some_secret_key" # Use a secure random value here
end

logging false
serve_static false


# Database configuration
DB_URL = "sqlite3:./db/users.db"

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

  DB.open(DB_URL) do |db|
    db.exec("INSERT INTO users (username, password) VALUES (?, ?)", username, password)
  end
  
  env.redirect "/login"
end

get "/login" do
  render "views/login.ecr"
end

post "/login" do |env|
  username = env.params.body["username"]
  password = env.params.body["password"]
  
  user_exists = false
  DB.open(DB_URL) do |db|
    db.query("SELECT EXISTS(SELECT 1 FROM users WHERE username = ? AND password = ?)", username, password) do |rs|
      if value = rs.read(Int32?) # Use Int32? to allow nil values
        user_exists = value != nil && value > 0
      end
    end
  end
  
  
  if user_exists
    env.session.string("username", username)
    env.redirect "/chat"
  else
    env.session.string("username", username)
    env.redirect "/chat"  # or redirect to a different page with an error message
  end
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