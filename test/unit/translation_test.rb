require File.dirname(__FILE__) + '/../test_helper'

class TranslationTest < Test::Unit::TestCase
  fixtures :translations

  def setup
    @translation = Translation.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Translation,  @translation
  end
end
