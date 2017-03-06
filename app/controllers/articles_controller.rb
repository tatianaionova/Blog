class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @user_blog = UserBlog.find(params[:user_blog_id])
    @article = @user_blog.articles.create(article_params)
    if @article.save
      redirect_to @user_blog, notice: "Article has been succesfully created"
    else
      render 'new'
    end
  end

  def update
    @user_blog = UserBlog.find(params[:user_blog_id])
    @article = @user_blog.articles.update(article_params)
  if @article.update(article_params)
    redirect_to @user_blog, notice: "Article has been succesfully updated"
  else
    render 'edit'
  end
end

def destroy
  @user_blog = UserBlog.find(params[:user_blog_id])
  @article = user_blog.articles.create(article_params)
  @article.destroy

  redirect_to articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text, :image_uid, :user_blog_id)
  end
end
