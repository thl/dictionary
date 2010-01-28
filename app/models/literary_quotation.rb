class LiteraryQuotation < ActiveRecord::Base
  has_one :meta, :foreign_key => 'literary_quotation_id'
  has_and_belongs_to_many :definitions, :join_table => 'definitions_literary_quotations', :foreign_key => 'literary_quotation_id'
  # belongs_to :definition, :foreign_key => "def_id"
  has_many :translations, :foreign_key => "literary_quotation_id"

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
