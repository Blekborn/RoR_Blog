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

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
