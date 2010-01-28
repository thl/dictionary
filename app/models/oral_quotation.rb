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
