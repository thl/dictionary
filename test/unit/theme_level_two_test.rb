require File.dirname(__FILE__) + '/../test_helper'

class ThemeLevelTwoTest < Test::Unit::TestCase
  fixtures :theme_level_twos

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: theme_level_twos
#
#  id             :integer         not null, primary key
#  theme_id       :integer
#  created_by     :string(80)
#  theme          :string(128)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)