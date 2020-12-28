class Post < ApplicationRecord
  belongs_to :author
  has_many :comments

  default_scope -> { order(created_at: :desc) }

  validates :author_id, presence: true
  validates :title, :content, presence: true
  validates :title, length: { maximum: 50 }
end
