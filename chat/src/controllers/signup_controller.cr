require "json"

module WebChat::Controllers
  class SignupController < ApplicationController
    def create
      user_data = JSON.parse(request.body.not_nil!, UserSignUpParams)
      user = User.new(user_data)
      if user.save
        json(status: "success")
      else
        json(status: "error", message: "Failed to create user")
      end
    end
    
    struct UserSignUpParams
      include JSON::Serializable
      property first_name : String
      property last_name : String
      property email : String
      property password : String
    end
  end
end
