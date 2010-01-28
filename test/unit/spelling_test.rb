require File.dirname(__FILE__) + '/../test_helper'

class SpellingTest < Test::Unit::TestCase
  fixtures :spellings

  def setup
    @spelling = Spelling.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Spelling,  @spelling
  end
end
