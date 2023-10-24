require "pg"
require "json"
require "crypto/bcrypt"
require "kemal"

# Initialize PostgreSQL connection
DB_URL = "postgres://xdb:crystal@localhost:5432/crystal"
MY_DB = PG.connect(DB_URL)

post "/signup" do |env|
  body = env.request.body.not_nil!.rewind.to_s
  data = JSON.parse(body)

  hashed_password = Crypto::Bcrypt.hash_secret(data["password"].as_s)

  # Save to PostgreSQL
  MY_DB.exec("INSERT INTO users (first_name, last_name, email, password) VALUES ($1, $2, $3, $4)", 
          [data["firstName"], data["lastName"], data["email"], hashed_password])

  # Send response
  env.response.content_type = "application/json"
  {"status": "success"}.to_json
end

post "/login" do |env|
  body = env.request.body.not_nil!.rewind.to_s
  data = JSON.parse(body)

  # Check in PostgreSQL for the user based on the email
  result = MY_DB.query_one?("SELECT password FROM users WHERE email = $1", [data["email"]], as: {password: String})
  
  if result && Crypto::Bcrypt::Password.new(result["password"]) == data["password"].as_s
    env.response.content_type = "application/json"
    {"status": "success"}.to_json
  else
    env.response.content_type = "application/json"
    {"status": "failed"}.to_json
  end
end

Kemal.run
