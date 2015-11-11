class Link < ActiveRecord::Base

  has_many :votes
  belongs_to :user
  has_many :taggings
  has_many :tags, :through => :taggings

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

  def tag_names=(tags)
    tags.split(",").collect{|t| t.strip}.each do |tag|
      this_tag = Tag.find_or_create_by(name: Tag.clean_name(tag))
      self.tags << this_tag
    end
  end

  def tag_names
    self.tags.collect{|t| t.name}.join(", ")
  end

end
