class Author < ApplicationRecord
  has_many :posts
  has_many :comments

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /\A
  (?=.{8,})
  (?=.*\d)
  (?=.*[a-z])
  (?=.*[[:^alnum:]])
/x
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  def full_name
    "#{first_name} #{last_name}"
  end
end
