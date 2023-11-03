class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      token = AuthenticationService.encode_token(@user.id)
      render json: { token: token }
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
