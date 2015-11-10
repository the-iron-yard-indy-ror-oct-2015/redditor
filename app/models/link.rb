class Link < ActiveRecord::Base

  has_many :votes
  belongs_to :user

  validates_presence_of :title, :url

  validates_format_of :url, :with => /\Ahttp(|s):\/\//

  before_validation :add_http

  def add_http
    unless self.url =~ /\Ahttp(|s):\/\//
      self.url = "http://" + self.url
    end
  end

  def cast_vote(user, value=1)
    vote = Vote.new(value: value, :user => user)
    self.votes << vote
    vote
  end

end
