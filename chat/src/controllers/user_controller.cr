struct UserSignUpParams
  include JSON::Serializable
  property first_name : String
  property last_name : String
  property email : String
  property password : String
end

class UserController < ApplicationController
  getter user = User.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_user }
  end

  def index
    users = User.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    user_data = UserSignUpParams.from_json(request.body.not_nil!)
    user = User.new(
      first_name: user_data.first_name,
      last_name: user_data.last_name,
      email: user_data.email,
      password: user_data.password
    )
    if user.save
      respond_with do
        json({"status" => "success"})
      end
    else
      respond_with do
        json({"status" => "error", "message" => "Could not create User!"})
      end
    end
  end
  
  

  def update
    user.set_attributes user_params.validate!
    if user.save
      redirect_to action: :index, flash: {"success" => "User has been updated."}
    else
      flash[:danger] = "Could not update User!"
      render "edit.slang"
    end
  end

  def destroy
    user.destroy
    redirect_to action: :index, flash: {"success" => "User has been deleted."}
  end

  private def user_params
    params.validation do
      required :first_name
      required :last_name
      required :email
      required :password
    end
  end

  private def set_user
    @user = User.find! params[:id]
  end
end
