require File.dirname(__FILE__) + '/../test_helper'

class DefTest < Test::Unit::TestCase
  fixtures :defs

  def setup
    @def = Def.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Def,  @def
  end
end
