class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable

  validates_presence_of :body

  def root_element
    commented_on = self.commentable
    while commented_on.is_a?(Comment)
      commented_on = commented_on.commentable
    end
    commented_on
  end

end
