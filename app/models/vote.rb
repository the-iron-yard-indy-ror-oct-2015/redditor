class Vote < ActiveRecord::Base

  belongs_to :link
  belongs_to :user

  validates :link_id, uniqueness: {scope: :user_id, message: "You can only vote for a link once."}

  after_save :update_link_totals

  def update_link_totals
    link.voted = true
    link.vote_total = link.votes.sum(:value)
    link.save!
  end

end
