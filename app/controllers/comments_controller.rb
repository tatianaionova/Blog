class CommentsController < ApplicationController

  def create
    @user_blog = find_blog
    @article = @user_blog.articles.find(find_params[:id])
    @comment = @article.comments.create(comment_params)
    @article.save
    redirect_to user_blog_article(@user_blog)
  end

  def destroy
    @user_blog = find_blog
    @article = @user_blog.articles.find(find_params[:id])
    @comment = @article.comments.create(comment_params)
    @comment.destroy
    redirect_to user_blog_article(@user_blog)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :article_id)
    end
    def find_blog
      UserBlog.find(params[:user_blog_id])
    end
    def find_params
      params.permit(:user_blog_id, :id)
    end
end
