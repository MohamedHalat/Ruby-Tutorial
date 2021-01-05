class User < ApplicationRecord
  before_save { email.downcase! }
  has_many :microposts
  validates :name, presence: true, length: { minimum: 0, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 0, maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  
  has_secure_password
  validates :password, length: { minimum: 6, maximum:128}
end
