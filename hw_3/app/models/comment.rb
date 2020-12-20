class Comment < ApplicationRecord
  belongs_to :post
  enum status: { unpublished: 0, published: 1 }
end
