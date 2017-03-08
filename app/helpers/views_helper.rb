module ViewsHelper
  #Links to blogs
  def to_blog(name, user_blog)
    link_to name, user_blog_path(user_blog)
  end
  def back_to_blogs
    link_to 'Back', user_blogs_path
  end
  def edit_blog(user_blog)
    link_to 'Edit', edit_user_blog_path(user_blog)
  end
  def new_blog
    link_to 'New blog', new_user_blog_path
  end
  def destroy_blog(user_blog)
    link_to 'Destroy', user_blog_path(user_blog),
           method: :delete,
           data: { confirm: 'Are you sure?' }
  end

  #Links to articles
  def edit_article(user_blog, article)
    link_to 'Edit', edit_user_blog_article_path(user_blog, article)
  end
  def show_article(user_blog, article)
    link_to 'Show', user_blog_article_path(user_blog, article)
  end
  def new_article(user_blog)
    link_to 'New article', new_user_blog_article_path(user_blog)
  end
  def destroy_article(user_blog, article)
    link_to 'Destroy', user_blog_article_path(user_blog, article),
           method: :delete,
           data: { confirm: 'Are you sure?' }
  end

end
