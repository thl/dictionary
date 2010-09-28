require File.dirname(__FILE__) + '/../test_helper'

class LiteraryPeriodTest < Test::Unit::TestCase
  fixtures :literary_periods

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: literary_periods
#
#  id              :integer         not null, primary key
#  created_by      :string(80)
#  literary_period :string(80)
#  update_history  :text
#  updated_by      :string(80)
#  created_at      :string(80)
#  updated_at      :string(80)