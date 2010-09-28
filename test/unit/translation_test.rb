require File.dirname(__FILE__) + '/../test_helper'

class TranslationTest < Test::Unit::TestCase
  fixtures :translations

  def setup
    @translation = Translation.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Translation,  @translation
  end
end


# == Schema Info
#
# Table name: translations
#
#  id                    :integer         not null, primary key
#  definition_id         :integer
#  etymology_id          :integer
#  language_type_id      :integer
#  literary_quotation_id :integer
#  model_sentence_id     :integer
#  oral_quotation_id     :integer
#  analytical_note       :string(1024)
#  created_by            :string(80)
#  language              :string(80)
#  translation           :text
#  update_history        :text
#  updated_by            :string(80)
#  created_at            :string(80)
#  updated_at            :string(80)