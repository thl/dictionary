require File.dirname(__FILE__) + '/../test_helper'

class EtymologyTest < Test::Unit::TestCase
  fixtures :etymologies

  def setup
    @etymology = Etymology.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Etymology,  @etymology
  end
end
