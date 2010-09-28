require File.dirname(__FILE__) + '/../test_helper'

class GrammarFunctionLevelTwoTest < Test::Unit::TestCase
  fixtures :grammar_function_level_twos

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: grammar_function_level_twos
#
#  id                  :integer         not null, primary key
#  grammar_function_id :integer
#  created_by          :string(80)
#  grammar_function    :string(128)
#  update_history      :text
#  updated_by          :string(80)
#  created_at          :string(80)
#  updated_at          :string(80)