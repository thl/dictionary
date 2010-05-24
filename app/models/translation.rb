class Translation < ActiveRecord::Base
  has_one :meta, :foreign_key => 'translation_id'
  belongs_to :etymology, :foreign_key => 'etymology_id'
  belongs_to :definition, :foreign_key => 'definition_id'
  belongs_to :literary_quotation, :foreign_key => "literary_quotation_id"
  belongs_to :oral_quotation, :foreign_key => 'oral_quotation_id'
  belongs_to :model_sentence, :foreign_key => 'model_sentence_id'

  belongs_to :language_type, :class_name => 'Category'

  def displayInfo
    str = ""
    str += translation unless translation == nil
    return str
  end

  #$language = "English, Tibetan, Classical Chinese, Modern Chinese, Sanskrit, Hindi, Nepali, Zhangzhung, Mongolian, Korean, Japanese, Pali".split(', ')
  $project = "Buddhist Tantra Terminology, TLLR Colloquial, Tournadre/Dorje Manual Glossary, TLLR Colloquial Standardized Spelling, TLLR Literary Glossary, THDL Architecture Terminology, THDL Astrology Terminology, THDL/Rubin Art Terminology, THDL Colophons, THDL Computer Science Terminology, THDL Library Science Terminology, THDL Medical Terminology, THDL Music Terminology, THDL Samantabhadra Titles, Public Domain Dictionary Entry Project".split(', ')
  $source_type = "personal communication, text, original".split(", ")

end
