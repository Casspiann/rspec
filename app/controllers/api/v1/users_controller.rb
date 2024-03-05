class Api::V1::UsersController < ApplicationController

 # skip_before_action :verify_authenticity_token, only: [:create]
  def create
    #debugger
    @user = User.new(user_params)

  if @user.save
    token = JsonWebToken.encode(user_id: @user.id)
    render json: { token: token, user_details: @user.as_json(except: [:password]) }, status: :created
  else
    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  end
  end

  def new
    @user = User.new
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end

