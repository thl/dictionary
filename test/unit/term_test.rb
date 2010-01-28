require File.dirname(__FILE__) + '/../test_helper'

class TermTest < Test::Unit::TestCase
  fixtures :terms

  def setup
    @term = Term.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Term,  @term
  end
end
