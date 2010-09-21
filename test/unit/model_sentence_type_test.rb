require File.dirname(__FILE__) + '/../test_helper'

class ModelSentenceTypeTest < Test::Unit::TestCase
  fixtures :model_sentence_types

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Info
#
# Table name: model_sentence_types
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  sentence_type  :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)