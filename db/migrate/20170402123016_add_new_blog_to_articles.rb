class AddNewBlogToArticles < ActiveRecord::Migration[5.0]
  def change
    if Article.where(user_blog_id: nil).exists?
      blog = UserBlog.find_or_create_by(title: 'General')
      Article.where(user_blog_id: nil).all.each do |article|
        article.update(:user_blog_id=>blog.id)
      end
    end
  end
end
