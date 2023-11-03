class AuthController < ApplicationController
  def login
    user = AuthenticationService.authenticate(params[:username], params[:password])

    if user
      token = AuthenticationService.encode_token(user.id)
      render json: { token: token }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end
end