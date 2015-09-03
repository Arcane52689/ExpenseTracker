class Session < ActiveRecord::Base
  belongs_to :user

  before_save :ensure_unique_token

  validates :token, presence: true, uniqueness: true

  def self.find_user_by_token(token)
    session = Session.find_by(token: token)
    return session.user if session
    nil
  end






  def ensure_unique_token
    self.token = SecureRandom.urlsafe_base64(16)
    ensure_unique_token if Session.exists?(token: self.token)
  end

end
