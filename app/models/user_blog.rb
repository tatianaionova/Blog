class UserBlog < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :title, presence: true,
                    length: { in: 5..50 }, uniqueness: true
end
