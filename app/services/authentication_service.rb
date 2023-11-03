class AuthenticationService
  def self.encode_token(user_id)
    exp = 24.hours.from_now.to_i
    payload = { user_id: user_id, exp: exp }
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def self.decode_token(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')[0]
  rescue JWT::DecodeError
    nil
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return user if user&.authenticate(password)

    nil
  end
end
