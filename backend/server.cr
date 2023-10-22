require "kemal"
require "json"
require "mongo"

# Initialize MongoDB
client = Mongo::Client.new("mongodb://localhost:27017", database: "chatdb")
users = client["users"]

post "/signup" do |env|
  body = env.request.body.rewind.to_s
  data = JSON.parse(body)

  # Validate data here (similar to your Vue.js checks)

  # Save to MongoDB
  users.insert_one(data.to_h)

  # Send response
  env.response.content_type = "application/json"
  {"status": "success"}.to_json
end

post "/login" do |env|
  body = env.request.body.rewind.to_s
  data = JSON.parse(body)

  # Check in MongoDB
  user = users.find_one({"username" => data["username"], "password" => data["password"]})

  if user
    env.response.content_type = "application/json"
    {"status": "success"}.to_json
  else
    env.response.content_type = "application/json"
    {"status": "failed"}.to_json
  end
end

Kemal.run
