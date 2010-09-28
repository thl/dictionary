require File.dirname(__FILE__) + '/../test_helper'

class GroupTest < Test::Unit::TestCase
  fixtures :groups

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: groups
#
#  id              :integer         not null, primary key
#  analytical_note :string(512)
#  created_by      :string(80)
#  group_name      :string(80)
#  update_history  :text
#  updated_by      :string(80)
#  created_at      :string(80)
#  updated_at      :string(80)