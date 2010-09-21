require File.dirname(__FILE__) + '/../test_helper'

class SpellingTest < Test::Unit::TestCase
  fixtures :spellings

  def setup
    @spelling = Spelling.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Spelling,  @spelling
  end
end


# == Schema Info
#
# Table name: spellings
#
#  id                           :integer         not null, primary key
#  basis_of_spelling_type_id    :integer
#  definition_id                :integer
#  literary_form_type_id        :integer
#  literary_genre_type_id       :integer
#  literary_period_type_id      :integer
#  major_dialect_family_type_id :integer
#  spelling_category_id         :integer
#  analytical_note              :string(512)
#  audio                        :string(120)
#  audio_date                   :string(80)
#  audio_description            :text
#  audio_id_number              :string(120)
#  audio_link                   :string(256)
#  audio_place_of_recording     :string(120)
#  audio_speaker                :string(120)
#  basis_of_spelling            :string(80)
#  created_by                   :string(80)
#  image                        :string(256)
#  image_caption                :string(256)
#  image_description            :string(512)
#  image_link                   :string(256)
#  image_photographer           :string(128)
#  literary_form                :string(80)
#  literary_genre               :string(80)
#  literary_period              :string(80)
#  major_dialect_family         :string(256)
#  specific_dialect             :string(80)
#  spelling                     :string(80)
#  spelling_type                :string(80)
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