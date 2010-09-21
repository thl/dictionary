require File.dirname(__FILE__) + '/../test_helper'

class ScriptTest < Test::Unit::TestCase
  fixtures :scripts

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: scripts
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  script         :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)