require File.dirname(__FILE__) + '/../test_helper'

class MetaTest < Test::Unit::TestCase
  fixtures :metas

  def setup
    @meta = Meta.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Meta,  @meta
  end
end
