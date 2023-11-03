require "json"

module WebChat::Controllers
  class LoginController < ApplicationController
    def create
      login_data = JSON.parse(request.body.not_nil!, UserLoginParams)
      user = User.find_by(email: login_data.email)
      if user && user.authenticate(login_data.password)
        json(status: "success")
      else
        json(status: "error", message: "Invalid email or password")
      end
    end
    
    struct UserLoginParams
      include JSON::Serializable
      property email : String
      property password : String
    end
  end
end
