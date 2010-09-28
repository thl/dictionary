require File.dirname(__FILE__) + '/../test_helper'

class TranslationEquivalentTest < Test::Unit::TestCase
  fixtures :translation_equivalents

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: translation_equivalents
#
#  id                       :integer         not null, primary key
#  def_id                   :integer
#  language_type_id         :integer
#  analytical_note          :string(512)
#  audio                    :string(120)
#  audio_date               :string(80)
#  audio_id_number          :string(120)
#  audio_link               :string(256)
#  audio_place_of_recording :string(120)
#  audio_speaker            :string(120)
#  created_by               :string(80)
#  image                    :string(256)
#  image_caption            :text
#  image_description        :text
#  image_link               :string(256)
#  image_photographer       :string(80)
#  language                 :string(80)      default("English")
#  translation_equivalent   :text
#  update_history           :text
#  updated_by               :string(80)
#  video                    :string(120)
#  video_date               :string(80)
#  video_id_number          :string(120)
#  video_link               :string(256)
#  video_place_of_recording :string(120)
#  video_speaker            :string(120)
#  created_at               :string(80)
#  updated_at               :string(80)