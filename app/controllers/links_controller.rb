class LinksController < ApplicationController
  before_action :check_if_current_user_is_owner, :only => [:edit, :update]

  def index
    @links = Link.all.sort_by{|link| link.votes.sum(:value)}.reverse
    # @links = Link.select("COUNT('votes.id') as vote_count, links.*").joins(:votes).order("vote_count DESC").limit(25)
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user = @current_user
    if @link.save
      flash[:success] = "Wahoo! You've submitted an awesome new link!"
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to root_url
    else
      render "edit"
    end
  end

  def click
    @link = Link.find(params[:id])
    @link.votes.create
    redirect_to @link.url
  end


  private

  def link_params
    params.require(:link).permit(:title, :url, :summary)
  end

  def check_if_current_user_is_owner
    @link = Link.find(params[:id])
    unless @link.user == @current_user
      flash[:danger] = "That's not your link, bub!"
      redirect_to root_url
    end
  end

end
