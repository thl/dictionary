require File.dirname(__FILE__) + '/../test_helper'

class ThematicClassificationTest < Test::Unit::TestCase
  fixtures :thematic_classifications

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: thematic_classifications
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  level1         :string(128)
#  level2         :string(128)
#  level3         :string(128)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)