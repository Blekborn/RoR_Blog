class Author < ApplicationRecord
  attr_accessor :remember_token
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 50 }
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  VALID_PASSWORD_REGEX = /\A
  (?=.{8,})
  (?=.*\d)
  (?=.*[a-z])
  (?=.*[[:^alnum:]])
/x
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
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

  def feed
    Post.where('author_id = ?', id)
  end
  
end
