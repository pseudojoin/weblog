class CommentsController < ApplicationController

  before_action :authenticate_user!

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments.all
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    respond_to do |format|
      format.js { render 'index' }
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js { render 'index' }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end