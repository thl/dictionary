require File.dirname(__FILE__) + '/../test_helper'

class SpellingMajorDialectTest < Test::Unit::TestCase
  fixtures :spelling_major_dialects

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: spelling_major_dialects
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  name           :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)