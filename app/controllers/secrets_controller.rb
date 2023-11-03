class SecretsController < ApplicationController
  before_action :authenticate_request

  def index
    @users = User.all
  end

  def secret_action
    render json: { message: "Welcome, #{current_user.username}!" }
  end
end
