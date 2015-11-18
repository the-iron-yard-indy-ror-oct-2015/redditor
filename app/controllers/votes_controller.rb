class VotesController < ApplicationController

  def create
    @link = Link.find(params[:link_id])
    if params[:downvote]
      value = -1
    else
      value = 1
    end
    vote = @link.cast_vote(@current_user, value)
    unless vote.persisted?
      flash[:warning] = vote.errors.first.last
    end
    respond_to do |format|
      format.html{ redirect_to :back }
      format.js {}
    end
  end

end
