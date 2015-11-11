class Tag < ActiveRecord::Base

  has_many :taggings
  has_many :links, :through => :taggings

  validates_uniqueness_of :name

  before_validation :downcase_name,
                    :strip_spaces,
                    :replace_spaces,
                    :strip_punctuation,
                    :strip_trailing_underscores,
                    :remove_double_underscores

  def downcase_name
    self.name = self.name.downcase
  end

  def strip_spaces
    self.name = self.name.strip
  end

  def replace_spaces
    self.name = self.name.gsub(" ", "_")
  end

  def strip_punctuation
    self.name = self.name.gsub(/\W/, "")
  end

  def strip_trailing_underscores
    self.name = self.name.gsub(/(_+)$/, "")
  end

  def remove_double_underscores
    self.name = self.name.gsub(/(_{2,})/, "_")
  end

  def self.clean_name(name)
    tag = Tag.new(name: name)
    tag.downcase_name
    tag.strip_spaces
    tag.replace_spaces
    tag.strip_punctuation
    tag.strip_trailing_underscores
    tag.remove_double_underscores
    tag.name
  end

end
