class Post < ApplicationRecord
  belongs_to :author, optional: true
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :title, :content, presence: true
  validates :title, length: { maximum: 50 }
  validates :content, presence: true
  #validates :author_id, presence: true

  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where('title LIKE ?', "%#{search}%")
  end

end
