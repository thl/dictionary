require File.dirname(__FILE__) + '/../test_helper'

class SpellingSpecificDialectTest < Test::Unit::TestCase
  fixtures :spelling_specific_dialects

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: spelling_specific_dialects
#
#  id               :integer         not null, primary key
#  major_dialect_id :integer
#  created_by       :string(80)
#  name             :string(80)
#  update_history   :text
#  updated_by       :string(80)
#  created_at       :string(80)
#  updated_at       :string(80)