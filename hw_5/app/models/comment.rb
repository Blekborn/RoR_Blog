class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author
  acts_as_votable
  has_ancestry
  validates :body, presence: true

  enum status: %i[unpublished published]

  # scope :published, -> { where(status: 1) }
  # scope :unpublished, -> { where(status: 0) }
end
