class Author < ApplicationRecord
  attr_accessor :remember_token

  has_many :posts, dependent: :destroy
  has_many :comments

  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  VALID_PASSWORD_REGEX = /\A
  (?=.{8,})
  (?=.*\d)
  (?=.*[a-z])
  (?=.*[[:^alnum:]])
/x
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true

  def Author.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def Author.new_token
    SecureRandom.urlsafe_base64
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def remember
    self.remember_token = Author.new_token
    update_attribute(:remember_digest, Author.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
