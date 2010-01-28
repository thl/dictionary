class ModelSentence < ActiveRecord::Base
  has_and_belongs_to_many :definitions, :join_table => 'definitions_model_sentences', :foreign_key => 'model_sentence_id'
  has_one :meta, :foreign_key => 'model_sentence_id'
  # belongs_to :definition, :foreign_key => "def_id"
  has_many :translations, :foreign_key => "model_sentence_id"

  belongs_to :language_type, :class_name => 'Category'
  belongs_to :literary_genre_type, :class_name => 'Category'
  belongs_to :literary_period_type, :class_name => 'Category'
  belongs_to :literary_form_type, :class_name => 'Category'
  belongs_to :major_dialect_family_type, :class_name => 'Category'

  def displayInfo
    str = ""
    str += model_sentence unless model_sentence == nil
    return str
  end
end
