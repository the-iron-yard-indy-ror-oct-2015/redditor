class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.commentable = Link.find(params[:link_id])
    if @comment.save
      flash[:success] = "Your comment has been created."
      redirect_to @comment.commentable
    else
      @link = @comment.commentable
      flash[:danger] = "There were some ... errors ..."
      render "links/show"
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
