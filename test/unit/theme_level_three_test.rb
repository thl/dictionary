require File.dirname(__FILE__) + '/../test_helper'

class ThemeLevelThreeTest < Test::Unit::TestCase
  fixtures :theme_level_threes

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: theme_level_threes
#
#  id             :integer         not null, primary key
#  theme_id       :integer
#  created_by     :string(80)
#  theme          :string(128)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)