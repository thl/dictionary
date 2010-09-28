require File.dirname(__FILE__) + '/../test_helper'

class ThemeLevelOneTest < Test::Unit::TestCase
  fixtures :theme_level_ones

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: theme_level_ones
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  theme          :string(128)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)