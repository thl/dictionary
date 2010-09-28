class OralQuotation < ActiveRecord::Base
  has_one :meta, :foreign_key => 'oral_quotation_id'
  has_and_belongs_to_many :definitions, :join_table => 'definitions_oral_quotations', :foreign_key => 'oral_quotation_id'
  # belongs_to :definition, :foreign_key => "def_id"
  has_many :translations, :foreign_key => "oral_quotation_id"

  belongs_to :source_speaker_dialect_type, :class_name => 'Category'

  def displayInfo
    str = ""
    str += source_id unless source_id == nil
    str += " | "
    str += transcript_in_tibetan unless transcript_in_tibetan == nil
    return str
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: oral_quotations
#
#  id                             :integer         not null, primary key
#  def_id                         :integer
#  source_id                      :string(256)
#  source_speaker_dialect_type_id :integer
#  time_line_id                   :string(120)
#  analytical_note                :string(512)
#  audio                          :string(120)
#  audio_date                     :string(80)
#  audio_description              :text
#  audio_id_number                :string(120)
#  audio_link                     :string(256)
#  audio_place_of_recording       :string(120)
#  audio_speaker                  :string(120)
#  created_by                     :string(80)
#  image                          :string(256)
#  image_caption                  :text
#  image_description              :text
#  image_link                     :string(256)
#  image_photographer             :string(80)
#  source                         :string(120)
#  source_location_of_speech      :string(120)
#  source_location_within_title   :string(120)
#  source_speaker                 :string(120)
#  source_speaker_dialect         :string(120)
#  source_speech_context          :string(120)
#  source_speech_date             :string(120)
#  source_speech_date_tibetan     :string(120)
#  source_speech_date_western     :string(120)
#  source_speech_type             :string(120)
#  source_title                   :string(120)
#  source_type                    :string(80)
#  transcript_in_tibetan          :string(256)
#  translation_of_transcript      :string(256)
#  update_history                 :text
#  updated_by                     :string(80)
#  video                          :string(120)
#  video_date                     :string(80)
#  video_description              :text
#  video_id_number                :string(120)
#  video_link                     :string(256)
#  video_place_of_recording       :string(120)
#  video_speaker                  :string(120)
#  created_at                     :string(80)
#  updated_at                     :string(80)