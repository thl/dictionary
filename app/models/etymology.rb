class Etymology < ActiveRecord::Base
  has_one :meta, :foreign_key => 'etymology_id'
  has_many :translations, :foreign_key => 'etymology_id'
  belongs_to :definition, :foreign_key => 'definition_id'

  belongs_to :etymology_category, :class_name => 'Category'
  belongs_to :derivation_type, :class_name => 'Category'
  belongs_to :loan_language_type, :class_name => 'Category'
  belongs_to :literary_genre_type, :class_name => 'Category'
  belongs_to :literary_period_type, :class_name => 'Category'
  belongs_to :literary_form_type, :class_name => 'Category'
  belongs_to :major_dialect_family_type, :class_name => 'Category'

  def displayInfo
    str = ""
    str += etymology unless etymology == nil
    return str
  end
  
  $etymology_type = "historical (linguistic), basic (syllabic), creative".split(', ')
  $derivation = "primary, derivate".split(", ")
  $major_dialect_family = "Standard Tibetan, Ütsang, Kham/Hor, Amdo, Tewo and Choni, Dzongkha-Sikkimese, Sherpa-Jirel, Lahul-Spiti, Ladakhi/Balti, Kyirong-Kagate, THDL Normalized Spelling, Alternative literary spelling, Mistaken spelling, Mistakenly corrected spelling, Old spelling, Vernacular Tibetan spelling, Standard Tibetan spelling, Unspecified".split(', ')
  $specific_dialect = "Unspecified, Local Spelling - Unknown Locale, Central dialect, Lhasa dialect, Lhokha dialect, Kongpo dialect, Tsang dialect, Tö dialect, Central Kham dialect, Southern Kham dialect, Northeastern Kham dialect, Hor dialect, North Kokonor Amdo dialect, West Kokonor Amdo dialect, Southeast Kokonor Amdo dialect, South Gansu dialect, Golok Amdo dialect, Ngapa Amdo dialect, Tewo dialect, Choni dialect, Dzongkha, Khyöcha Ngachakha, Lakha, Merak Sakteng nomad dialect, Dur nomad dialect, Sikkimese, Sherpa dialect, Jirel dialect, Lahul/Garshwa dialect, Spiti dialect, Nyam dialect, Balti dialect, Ladakhi, Purik dialect, Kyirong dialect, Kagate dialect, Tsum dialect, Langtang dialect, Yolmo (Helambu Sherpa) dialect, other".split(', ')
  $literary_genre = "".split(', ')
  $literary_period = "old literary, classical literary, modern literary".split(', ')
  $literary_form = "prose, verse, mixed prose/verse".split(', ')
  $project = "Buddhist Tantra Terminology, TLLR Colloquial, Tournadre/Dorje Manual Glossary, TLLR Colloquial Standardized Spelling, TLLR Literary Glossary, THDL Architecture Terminology, THDL Astrology Terminology, THDL/Rubin Art Terminology, THDL Colophons, THDL Computer Science Terminology, THDL Library Science Terminology, THDL Medical Terminology, THDL Music Terminology, THDL Samantabhadra Titles, Public Domain Dictionary Entry Project".split(', ')
  $source_type = "personal communication, text, original".split(", ")

end
