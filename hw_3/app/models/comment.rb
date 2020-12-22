class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author

  validates :body, presence: true

  enum status: %i[unpublished published]

  scope :published, -> { where(status: 1) }
  scope :unpublished, -> { where(unpublished: 0) }
end
