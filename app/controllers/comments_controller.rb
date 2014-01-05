class CommentsController < ApplicationController
  before_filter :load_article
  def create
    @comment = @article.comments.new(params[:comment])
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @article, :success => "comment has been posted successfully!" }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @article, :alert => 'failure' }
        format.js { render 'fail_create.js.erb' }
      end
    end
  end
  private
  def load_article
    @article = Article.find(params[:article_id])
  end
end
