require File.dirname(__FILE__) + '/../test_helper'

class SourceTypeTest < Test::Unit::TestCase
  fixtures :source_types

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: source_types
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  source_type    :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)