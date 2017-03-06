class Article < ApplicationRecord
  mount_uploader :image_uid, ImageUploader
  belongs_to :user_blog
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { in: 5..35 }
end
