require "pg"
require "json"
require "openssl"
require "kemal"

# Helper method to convert a Slice(UInt8) to a hexadecimal string
def to_hex(slice : Slice(UInt8)) : String
  slice.hexstring
end

# Initialize PostgreSQL connection
DB_URL = "postgres://xdb:crystal@localhost:5432/crystal"
MY_DB = PG.connect(DB_URL)

# Method to test database connection
def test_query(db : PG::Connection)
  begin
    db.query("SELECT 1") do |rs|
      puts "Connected" if rs.read(Int32?) == 1
    end
  rescue e : PG::Error
    puts "Connection Failed: #{e.message}"
  end
end

# Set up CORS headers
before_get "/" do |env|
  env.response.headers["Access-Control-Allow-Origin"] = "*"
  env.response.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS"
  env.response.headers["Access-Control-Allow-Headers"] = "Content-Type"
end

before_post "/" do |env|
  env.response.headers["Access-Control-Allow-Origin"] = "*"
  env.response.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS"
  env.response.headers["Access-Control-Allow-Headers"] = "Content-Type"
end

# Handle OPTIONS method for /signup route
options "/signup" do |env|
  env.response.headers["Allow"] = "POST, OPTIONS"
  env.response.content_type = "text/plain"
  ""
end
# Handle OPTIONS method for /login route
options "/login" do |env|
  env.response.headers["Allow"] = "POST, OPTIONS"
  env.response.content_type = "text/plain"
  ""
end


post "/signup" do |env|
  body = env.request.body.not_nil!.rewind.to_s
  data = JSON.parse(body)

  hashed_password = to_hex(OpenSSL::Digest.new("SHA256").update(data["password"].as_s).final)

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
  
  if result && to_hex(OpenSSL::Digest.new("SHA256").update(data["password"].as_s).final) == result["password"]  # Updated
    env.response.content_type = "application/json"
    {"status": "success"}.to_json
  else
    env.response.content_type = "application/json"
    {"status": "failed"}.to_json
  end
end

Kemal.run
