class TranslationEquivalent < ActiveRecord::Base
  has_one :meta, :foreign_key => 'translation_equivalent_id'
  belongs_to :definition, :foreign_key => "def_id"

  belongs_to :language_type, :class_name => 'Category'

  def displayInfo
    str = ""
    str += translation_equivalent unless translation_equivalent == nil
    return str
  end
end
