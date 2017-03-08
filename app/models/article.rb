class Article < ApplicationRecord
  mount_uploader :image_uid, ImageUploader
  belongs_to :user_blog
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, :reject_if => :all_blank
  validates :title, presence: true,
                    length: { in: 5..35 }
end
