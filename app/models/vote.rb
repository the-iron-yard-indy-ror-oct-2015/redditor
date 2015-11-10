class Vote < ActiveRecord::Base

  belongs_to :link
  belongs_to :user

  validates :link_id, uniqueness: {scope: :user_id, message: "You can only vote for a link once."}

end
