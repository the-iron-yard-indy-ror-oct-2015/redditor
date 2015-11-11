require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "adding funky links" do
    link = Link.new(:title => "Rubular",
                    :url => "http://rubular.com",
                    :tag_names => "my AWESOME tag set of #%!^$%$&%#&@&#^$Q!& regexes , saveme, please, this is embarassing")
    assert link.save
  end
end
