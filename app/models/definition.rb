class Definition < ActiveRecord::Base
  
  #has_many :definition_definition_forms, :foreign_key => 'term_id'
  has_many :definition_definition_form_tos, :class_name => "DefinitionDefinitionForm", :foreign_key => "def2_id"
  has_many :definition_definition_form_froms, :class_name => "DefinitionDefinitionForm", :foreign_key => "def1_id"
  has_many :super_definitions, :class_name => "DefinitionDefinition", :foreign_key => "def1_id"
  has_many :sub_definitions, :class_name => "DefinitionDefinition", :foreign_key => "def2_id"
  has_and_belongs_to_many :related_definitions, :class_name => "Definition", :join_table => "related_definitions", :foreign_key => "def1_id", :association_foreign_key => "def2_id", :after_add => :relate_defs, :after_remove => :unrelate_defs
  has_and_belongs_to_many :full_synonyms, :join_table => 'definition_full_synonyms', :foreign_key => 'definition_id', :association_foreign_key => 'full_synonym_id'
  # has_many :full_synonyms_froms, :class_name => 'FullSynonym', :foreign_key => 'def1_id'
  # has_many :full_synonyms_tos, :class_name => 'FullSynonym', :foreign_key => 'def2_id'
  has_many :etymologies, :foreign_key => 'definition_id'
  has_many :spellings, :foreign_key => 'definition_id'
  has_many :translations, :foreign_key => 'definition_id'
  has_many :pronunciations, :foreign_key => 'def_id'
  has_and_belongs_to_many :literary_quotations, :join_table => 'definitions_literary_quotations', :foreign_key => 'definition_id'
  has_many :translation_equivalents, :foreign_key => 'def_id'
  has_and_belongs_to_many :oral_quotations, :join_table => 'definitions_oral_quotations', :foreign_key => 'definition_id'
  # has_many :oral_quotations, :foreign_key => 'def_id'
  has_and_belongs_to_many :model_sentences, :join_table => 'definitions_model_sentences', :foreign_key => 'definition_id'
  # has_many :model_sentences, :foreign_key => 'def_id'
  has_one :meta, :foreign_key => 'definition_id'

  has_many :definition_category_associations, :dependent => :destroy
  has_many :not_fixed_associations, :dependent => :destroy, :class_name => 'DefinitionCategoryAssociation', :conditions => ["category_branch_id NOT IN (#{Array.new(DefinitionCategoryAssociation::FIXED.size, '?').join(',')})"] + DefinitionCategoryAssociation::FIXED.keys
  
  
  belongs_to :grammatical_function_type, :class_name => 'Category'
  belongs_to :language_type, :class_name => 'Category'
  belongs_to :register_type, :class_name => 'Category'
  belongs_to :language_context_type, :class_name => 'Category'
  belongs_to :literary_genre_type, :class_name => 'Category'
  belongs_to :literary_period_type, :class_name => 'Category'
  belongs_to :literary_form_type, :class_name => 'Category' #it was defined like 'literary_form_type_id'
  belongs_to :major_dialect_family_type, :class_name => 'Category'
  belongs_to :thematic_classification_type, :class_name => 'Category'
  
  belongs_to :root_letter, :class_name => 'ComplexScripts::TibetanLetter'

  # before_add
  # before_remove
  
  before_save do |record|
    if record.wylie_changed? && !record.wylie.blank? && !record.root_letter_id_changed? && record.level == 'head term'
      root_letter_str = record.wylie.base_letter('bod')
      if !root_letter_str.nil?
        root_letter = ComplexScripts::TibetanLetter.find_by_wylie(root_letter_str)
        record.root_letter = root_letter if !root_letter.nil?
      end
    end
  end
  
  def find_head_term
    if level == 'head term'
      return id
    end
    if sub_definitions.size > 0
      if sub_definitions[0].super_definition != nil
        if sub_definitions[0].super_definition.level == 'head term'
          return sub_definitions[0].super_definition.id
        else
          return sub_definitions[0].super_definition.find_head_term
        end
      else
        return nil
      end
    else
      return nil
    end
  end

  # def update_attribute(attribute,value)
  #   puts '~~~~~~~~~~~~~~~updated'
  #   self.update_attribute(attribute,value)
  # end
    
  def relate_defs(definition)
    definition.related_definitions << self unless definition.related_definitions.include?(self)
  end

  def unrelate_defs(definition)
    definition.related_definitions.delete(self) rescue nil
  end
  
  def displayInfo
    str = ""
    str += term unless term == nil
    str += " ["+level+"] " unless level == nil
    str += " | "
    #str += " ["+grammatical_function+"] " unless grammatical_function == nil
    #str += " ["+level+"] " unless level == nil
    str += definition unless definition == nil
    str += " ("+super_definitions.size.to_s+" sub def)"
    return str
  end

  def displayInfoPublic
    str = ""
    str += " ["+level+"] " unless level == nil
    str += " | "
    #str += " ["+grammatical_function+"] " unless grammatical_function == nil
    #str += " ["+level+"] " unless level == nil
    str += definition unless definition == nil
    str += " ("+super_definitions.size.to_s+" sub def)"
    return str
  end

  def displayInfoPublicBasic
    str = ""
    str += definition unless definition == nil
    return str
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