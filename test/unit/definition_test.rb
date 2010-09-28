require File.dirname(__FILE__) + '/../test_helper'

class DefinitionTest < Test::Unit::TestCase
  fixtures :definitions

  def setup
    @definition = Definition.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Definition,  @definition
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: definitions
#
#  id                              :integer         not null, primary key
#  grammatical_function_type_id    :integer
#  language_context_type_id        :integer
#  language_type_id                :integer
#  literary_form_type_id           :integer
#  literary_genre_type_id          :integer
#  literary_period_type_id         :integer
#  major_dialect_family_type_id    :integer
#  register_type_id                :integer
#  root_letter_id                  :integer
#  thematic_classification_type_id :integer
#  analytical_note                 :string(512)
#  audio                           :string(120)
#  audio_date                      :string(80)
#  audio_description               :text
#  audio_id_number                 :string(120)
#  audio_link                      :string(256)
#  audio_place_of_recording        :string(120)
#  audio_speaker                   :string(120)
#  created_by                      :string(80)
#  definition                      :text
#  encyclopedia_entry              :string(1024)
#  grammatical_function            :string(80)
#  image                           :string(256)
#  image_caption                   :string(256)
#  image_description               :string(512)
#  image_link                      :string(256)
#  image_photographer              :string(128)
#  language                        :string(80)
#  language_context                :string(256)
#  level                           :string(80)
#  literary_form                   :string(80)
#  literary_genre                  :string(80)
#  literary_period                 :string(80)
#  major_dialect_family            :string(80)
#  numerology                      :integer
#  phonetic                        :string(255)
#  register                        :string(80)
#  sort_order                      :integer
#  specific_dialect                :string(80)
#  tense                           :string(128)
#  term                            :string(255)
#  thematic_classification         :string(80)
#  update_history                  :text
#  updated_by                      :string(80)
#  video                           :string(120)
#  video_date                      :string(80)
#  video_description               :text
#  video_id_number                 :string(120)
#  video_link                      :string(256)
#  video_place_of_recording        :string(120)
#  video_speaker                   :string(120)
#  wylie                           :string(255)
#  created_at                      :string(80)
#  updated_at                      :string(80)