require "kemal"

# Manually handle CORS by adding headers
before_all do |env|
  env.response.headers["Access-Control-Allow-Origin"] = "*"
  env.response.headers["Access-Control-Allow-Methods"] = "GET, POST, PUT, DELETE, OPTIONS"
  env.response.headers["Access-Control-Allow-Headers"] = "Accept, Authorization, Content-Type"
  
  # Respond to preflight OPTIONS requests
  if env.request.method == "OPTIONS"
    env.response.status_code = 200
    halt env
  end
end

# Registration endpoint
post "/api/register" do |env|
  # Extract user data from request
  email = env.params.body["email"]?
  password = env.params.body["password"]?
  
  # TODO: Implement user registration logic
  
  # Respond
  env.response.content_type = "application/json"
  {status: "success"}.to_json
end

# Login endpoint
post "/api/login" do |env|
  # Extract user data from request
  email = env.params.body["email"]?
  password = env.params.body["password"]?
  
  # TODO: Implement login logic
  
  # Respond
  env.response.content_type = "application/json"
  {status: "success"}.to_json
end

# Start Kemal
Kemal.run
