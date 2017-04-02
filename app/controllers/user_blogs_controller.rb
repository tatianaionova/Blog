class UserBlogsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
  def index
    @user_blogs = UserBlog.all
  end

  def show
    @user_blog = UserBlog.find(params[:id])
  end

  def new
    @user_blog = UserBlog.new
  end

  def edit
    @user_blog = UserBlog.find(params[:id])
  end

  def create
    @user_blog = UserBlog.new(blog_params)
    if @user_blog.save
      redirect_to @user_blog, notice: "Blog has been succesfully created"
    else
      render 'new'
    end
  end

  def update
  @user_blog = UserBlog.find(params[:id])
  if @user_blog.update(blog_params)
    redirect_to @user_blog
  else
    render 'edit'
  end
end

def destroy
  @user_blog = UserBlog.find(params[:id])
  @user_blog.destroy

  redirect_to user_blogs_path
end

private
  def blog_params
    params.require(:user_blog).permit(:title)
  end
end
