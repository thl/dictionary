require File.dirname(__FILE__) + '/../test_helper'

class DefinitionDefinitionFormTest < Test::Unit::TestCase
  fixtures :definition_definition_forms

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: definition_definition_forms
#
#  id                :integer         not null, primary key
#  def1_id           :integer
#  def2_id           :integer
#  created_by        :string(80)
#  relationship_from :string(256)
#  relationship_to   :string(256)
#  role              :string(128)
#  update_history    :text
#  updated_by        :string(80)
#  created_at        :string(80)
#  updated_at        :string(80)