class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { email.downcase! }
  has_many :microposts
  validates :name, presence: true, length: { minimum: 0, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 0, maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password
  validates :password, length: { minimum: 6, maximum: 128 }, allow_nil: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget 
    update_attribute(:remember_digest, nil)
  end

  def update(params)
    name ||= params[:name]
    email ||= params[:email]
    password ||= params[:password]

    update_attribute(:name, name)
    update_attribute(:email, email)
    update_attribute(:password, password)
  end
end
