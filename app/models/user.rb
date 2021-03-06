require 'bcrypt'

class User < ActiveRecord::Base
  attr_reader :password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :sessions, dependent: :destroy


  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    return user if user.is_password?(password)
    nil
  end




  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end




end
