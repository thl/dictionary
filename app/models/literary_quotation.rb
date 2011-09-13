class LiteraryQuotation < ActiveRecord::Base
  has_one :meta, :foreign_key => 'literary_quotation_id'
  has_and_belongs_to_many :definitions, :join_table => 'definitions_literary_quotations', :foreign_key => 'literary_quotation_id'
  # belongs_to :definition, :foreign_key => "def_id"
  has_many :translations, :foreign_key => "literary_quotation_id"

  has_many :category_literary_quotation_associations, :dependent => :destroy
  belongs_to :language_of_translation_type, :class_name => 'Category'
  belongs_to :literary_genre_type, :class_name => 'Category'
  belongs_to :literary_period_type, :class_name => 'Category'
  belongs_to :literary_form_type, :class_name => 'Category'
  belongs_to :script_type, :class_name => 'Category'

  def displayInfo
    str = ""
    str += title unless title == nil
    str += " : "
    str += passage unless passage == nil
    return str
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: literary_quotations
#
#  id                              :integer         not null, primary key
#  def_id                          :integer
#  language_of_translation_type_id :integer
#  line_id                         :string(256)
#  literary_form_type_id           :integer
#  literary_genre_type_id          :integer
#  literary_period_type_id         :integer
#  script_type_id                  :integer
#  source_id                       :string(128)
#  analytical_note                 :string(512)
#  audio                           :string(120)
#  audio_date                      :string(80)
#  audio_description               :text
#  audio_id_number                 :string(120)
#  audio_link                      :string(256)
#  audio_place_of_recording        :string(120)
#  audio_speaker                   :string(120)
#  author                          :string(128)
#  created_by                      :string(80)
#  edition                         :string(128)
#  image                           :string(256)
#  image_caption                   :text
#  image_description               :text
#  image_link                      :string(256)
#  image_photographer              :string(80)
#  isbn                            :string(128)
#  language_of_translation         :string(80)
#  line_number                     :string(80)
#  literary_form                   :string(80)
#  literary_genre                  :string(128)
#  literary_period                 :string(80)
#  page_image_link                 :string(256)
#  page_side                       :string(80)
#  passage                         :text
#  passage_number                  :string(128)
#  passage_pound                   :integer
#  place_of_publication            :string(128)
#  published_date                  :string(128)
#  publisher                       :string(128)
#  script                          :string(256)
#  source                          :string(256)
#  spelling                        :string(256)
#  tibetan_date                    :string(128)
#  tibetan_date_note               :string(1025)
#  title                           :string(128)
#  update_history                  :text
#  updated_by                      :string(80)
#  url                             :string(256)
#  video                           :string(120)
#  video_date                      :string(80)
#  video_description               :text
#  video_id_number                 :string(120)
#  video_link                      :string(256)
#  video_place_of_recording        :string(120)
#  video_speaker                   :string(120)
#  volume_number                   :string(128)
#  western_date                    :string(128)
#  western_date_note               :string(1025)
#  created_at                      :string(80)
#  updated_at                      :string(80)