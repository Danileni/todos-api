class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :logout]
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def logout
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(message: "You have successfully logged out")
  end

  private

  def auth_params
    params.permit(:email, :password)
  end

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end