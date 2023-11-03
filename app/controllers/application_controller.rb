class ApplicationController < ActionController::API
  def current_user
    return @current_user if defined?(@current_user)
    token = request.headers['Authorization']&.split(' ')&.last
    return unless token

    decoded = AuthenticationService.decode_token(token)
    @current_user = User.find(decoded['user_id'])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    nil
  end

  def authenticate_request
    render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user
  end
end
