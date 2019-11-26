
class User < ApplicationRecord
  after_initialize :ensure_session_token
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  # validates :password , length: { minimum 6, allow_nil: true }

  # after_initialize :reset_session_token!
  attr_reader :password

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(login_params)
    user = User.find_by(username: login_params[:username])

    return nil unless user
    user.is_password?(login_params[:password]) ? user : nil  
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password) 
  end

   def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end


end
