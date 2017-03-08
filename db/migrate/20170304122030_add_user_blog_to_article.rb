class AddUserBlogToArticle < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :user_blog, foreign_key: true
  end
end
