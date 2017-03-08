class ArticlesController < ApplicationController

  def show
    @user_blog = find_blog
    @article = @user_blog.articles.find(find_params[:id])
  end

  def new
    @user_blog = find_blog
    @article = @user_blog.articles.new
    1.times { @article.comments.build }
  end

  def edit
    @user_blog = find_blog
    @article = @user_blog.articles.find(find_params[:id])
    1.times { @article.comments.build }
  end

  def create
    @user_blog = find_blog
    @article = @user_blog.articles.new(article_params)
    if @article.save
      redirect_to @user_blog, notice: "Article has been succesfully created"
    else
      render 'new'
    end
  end

  def update
    @user_blog = find_blog
    @article = @user_blog.articles.find(find_params[:id])
  if @article.update(article_params)
    redirect_to @user_blog, notice: "Article has been succesfully updated"
  else
    render 'edit'
  end
end

def destroy
  @user_blog = find_blog
  @article = @user_blog.articles.find(find_params[:id])
  @article.destroy

  redirect_to @user_blog, notice: "Article has been succesfully deleted"
end

private
  def article_params
    params.require(:article).permit(:title, :text, :image_uid, :user_blog_id, comments_attributes: [:commenter, :body])
  end

  def find_blog
    UserBlog.find(params[:user_blog_id])
  end

  def find_params
    params.permit(:user_blog_id, :id)
  end
end
