class Meta < ActiveRecord::Base
  belongs_to :definition, :foreign_key => 'definition_id'
  belongs_to :translation, :foreign_key => 'translation_id'
  belongs_to :spelling, :foreign_key => 'spelling_id'
  belongs_to :etymology, :foreign_key => 'etymology_id'
  belongs_to :literary_quotation, :foreign_key => 'literary_quotation_id'
  belongs_to :pronunciation, :foreign_key => 'pronunciation_id'
  belongs_to :translation_equivalent, :foreign_key => 'translation_equivalent_id'
  belongs_to :full_synonym, :foreign_key => 'full_synonym_id'
  belongs_to :oral_quotation, :foreign_key => 'oral_quotation_id'
  belongs_to :group, :foreign_key => 'group_id'
  belongs_to :model_sentence, :foreign_key => 'model_sentence_id'
  belongs_to :definition_definition_form, :foreign_key => 'definition_definition_form_id'
  has_and_belongs_to_many :sources, :join_table => 'meta_source', :foreign_key => 'meta_id', :association_foreign_key => 'source_id'

  belongs_to :project_type, :class_name => 'Category'
  belongs_to :language_type, :class_name => 'Category'

  def displayInfo
    str = ""
    str += project unless project == nil
    str += ':'
    str += source unless source == nil
    return str
  end

  $project = "Buddhist Tantra Terminology, TLLR Colloquial, Tournadre/Dorje Manual Glossary, TLLR Colloquial Standardized Spelling, TLLR Literary Glossary, THDL Architecture Terminology, THDL Astrology Terminology, THDL/Rubin Art Terminology, THDL Colophons, THDL Computer Science Terminology, THDL Library Science Terminology, THDL Medical Terminology, THDL Music Terminology, THDL Samantabhadra Titles, Public Domain Dictionary Entry Project".split(', ')
  $source_type = "personal communication, text, original".split(", ")
end
