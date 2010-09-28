require File.dirname(__FILE__) + '/../test_helper'

class SpecificDialectTest < Test::Unit::TestCase
  fixtures :specific_dialects

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: specific_dialects
#
#  id               :integer         not null, primary key
#  major_dialect_id :integer
#  created_by       :string(80)
#  name             :string(80)
#  update_history   :text
#  updated_by       :string(80)
#  created_at       :string(80)
#  updated_at       :string(80)