class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if params[:link_id]
      @comment.commentable = Link.find(params[:link_id])
    elsif params[:comment_id]
      @comment.commentable = Comment.find(params[:comment_id])
    end
    if @comment.save
      flash[:success] = "Your comment has been created."
      redirect_to link_path(@comment.root_element, anchor: "comment-#{@comment.id}")
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
