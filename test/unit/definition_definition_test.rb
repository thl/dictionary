require File.dirname(__FILE__) + '/../test_helper'

class DefinitionDefinitionTest < Test::Unit::TestCase
  fixtures :definition_definitions

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: definition_definitions
#
#  id             :integer         not null, primary key
#  def1_id        :integer
#  def2_id        :integer
#  created_by     :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)