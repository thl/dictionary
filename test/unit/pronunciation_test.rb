require File.dirname(__FILE__) + '/../test_helper'

class PronunciationTest < Test::Unit::TestCase
  fixtures :pronunciations

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: pronunciations
#
#  id                           :integer         not null, primary key
#  def_id                       :integer
#  literary_form_type_id        :integer
#  literary_genre_type_id       :integer
#  literary_period_type_id      :integer
#  major_dialect_family_type_id :integer
#  pronunciation_category_id    :integer
#  analytical_note              :string(512)
#  audio                        :string(120)
#  audio_date                   :string(80)
#  audio_description            :text
#  audio_id_number              :string(120)
#  audio_link                   :string(256)
#  audio_place_of_recording     :string(120)
#  audio_speaker                :string(120)
#  created_by                   :string(80)
#  image                        :string(256)
#  image_caption                :text
#  image_description            :text
#  image_link                   :string(256)
#  image_photographer           :string(80)
#  literary_form                :string(80)
#  literary_genre               :string(80)
#  literary_period              :string(80)
#  major_dialect_family         :string(80)
#  phonetic_transliteration     :string(256)
#  pronunciation_type           :string(80)
#  specific_dialect             :string(80)
#  update_history               :text
#  updated_by                   :string(80)
#  video                        :string(120)
#  video_date                   :string(80)
#  video_description            :text
#  video_id_number              :string(120)
#  video_link                   :string(256)
#  video_place_of_recording     :string(120)
#  video_speaker                :string(120)
#  created_at                   :string(80)
#  updated_at                   :string(80)