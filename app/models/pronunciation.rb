class Pronunciation < ActiveRecord::Base
  has_one :meta, :foreign_key => 'pronunciation_id'
  belongs_to :definition, :foreign_key => "def_id"

  belongs_to :pronunciation_category, :class_name => 'Category'
  belongs_to :literary_genre_type, :class_name => 'Category'
  belongs_to :literary_period_type, :class_name => 'Category'
  belongs_to :literary_form_type, :class_name => 'Category'
  belongs_to :major_dialect_family_type, :class_name => 'Category'

  def displayInfo
    str = ""
    str += phonetic_transliteration unless phonetic_transliteration == nil
    return str
  end
end
