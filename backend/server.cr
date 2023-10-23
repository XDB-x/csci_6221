require "kemal"
require "json"
require "mongo"
require "crypto/bcrypt"

# Initialize MongoDB
client = Mongo::Client.new("mongodb://localhost:27017", database: "crystal")
users = client["UserInfo"]

post "/signup" do |env|
  body = env.request.body.rewind.to_s
  data = JSON.parse(body)

  # Validate data
  
  hashed_password = Crypto::Bcrypt::Password.create(data["password"])

  # Save to MongoDB
  user_data = {
    "firstName" => data["firstName"],
    "lastName"  => data["lastName"],
    "email"     => data["email"],
    "password"  => hashed_password.to_s
  }

  users.insert_one(user_data)

  # Send response
  env.response.content_type = "application/json"
  {"status": "success"}.to_json
end

post "/login" do |env|
  body = env.request.body.rewind.to_s
  data = JSON.parse(body)

  # Check in MongoDB for the user based on the email
  user = users.find_one({"email" => data["email"]})

  if user && Crypto::Bcrypt::Password.new(user["password"]) == data["password"]
    env.response.content_type = "application/json"
    {"status": "success"}.to_json
  else
    env.response.content_type = "application/json"
    {"status": "failed"}.to_json
  end
end

Kemal.run
