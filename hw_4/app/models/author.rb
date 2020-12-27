class Author < ApplicationRecord
  has_many :posts
  has_many :comments

  has_secure_password
  validates :email, presence: true, uniqueness: true

  # attr_accessor :email, :password, :password_confirmation
  # validates_uniqueness_of :email

  def full_name
    "#{first_name} #{last_name}"
  end
end
