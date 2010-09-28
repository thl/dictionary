require File.dirname(__FILE__) + '/../test_helper'

class LiteraryFormTest < Test::Unit::TestCase
  fixtures :literary_forms

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: literary_forms
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  literary_form  :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)