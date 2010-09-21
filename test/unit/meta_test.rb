require File.dirname(__FILE__) + '/../test_helper'

class MetaTest < Test::Unit::TestCase
  fixtures :metas

  def setup
    @meta = Meta.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Meta,  @meta
  end
end


# == Schema Info
#
# Table name: metas
#
#  id                            :integer         not null, primary key
#  definition_definition_form_id :integer
#  definition_id                 :integer
#  etymology_id                  :integer
#  full_synonym_id               :integer
#  group_id                      :integer
#  language_type_id              :integer
#  literary_quotation_id         :integer
#  model_sentence_id             :integer
#  oral_quotation_id             :integer
#  project_type_id               :integer
#  pronunciation_id              :integer
#  spelling_id                   :integer
#  translation_equivalent_id     :integer
#  translation_id                :integer
#  author                        :string(512)
#  created_by                    :string(80)
#  date_of_publication           :string(128)
#  language                      :string(120)
#  metadata_note                 :string(512)
#  page_number                   :string(128)
#  place_of_publication          :string(128)
#  precedence                    :integer
#  project                       :string(120)
#  publisher                     :string(128)
#  source                        :string(120)
#  source_type                   :string(80)
#  title                         :string(512)
#  update_history                :text
#  updated_by                    :string(80)
#  created_at                    :string(80)
#  updated_at                    :string(80)