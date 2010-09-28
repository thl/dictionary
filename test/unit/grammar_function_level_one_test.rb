require File.dirname(__FILE__) + '/../test_helper'

class GrammarFunctionLevelOneTest < Test::Unit::TestCase
  fixtures :grammar_function_level_ones

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: grammar_function_level_ones
#
#  id               :integer         not null, primary key
#  created_by       :string(80)
#  grammar_function :string(128)
#  update_history   :text
#  updated_by       :string(80)
#  created_at       :string(80)
#  updated_at       :string(80)