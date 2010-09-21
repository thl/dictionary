require File.dirname(__FILE__) + '/../test_helper'

class FullSynonymTest < Test::Unit::TestCase
  fixtures :full_synonyms

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: full_synonyms
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  term           :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)