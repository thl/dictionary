require File.dirname(__FILE__) + '/../test_helper'

class DefinitionTest < Test::Unit::TestCase
  fixtures :definitions

  def setup
    @definition = Definition.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Definition,  @definition
  end
end
