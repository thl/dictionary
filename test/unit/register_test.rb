require File.dirname(__FILE__) + '/../test_helper'

class RegisterTest < Test::Unit::TestCase
  fixtures :registers

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: registers
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  register       :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)