class FullSynonym < ActiveRecord::Base
  has_one :meta, :foreign_key => 'full_synonym_id'
  has_and_belongs_to_many :definitions, :join_table => 'definition_full_synonyms', :association_foreign_key => 'definition_id', :foreign_key => 'full_synonym_id'
  # belongs_to :definition_to, :class_name => 'Definition', :foreign_key => "def2_id"
  # belongs_to :definition_from, :class_name => 'Definition', :foreign_key => "def1_id"

  def displayInfo
    str = ""
    str += term unless term == nil
    return str
  end

  # def displayToInfo
  #   str = ""
  #   str += definition_from.displayInfo unless definition_from == nil
  #   str += " :: "
  #   str += term unless term == nil
  #   return str
  # end
  # 
  # def displayFromInfo
  #   str = ""
  #   str += definition_to.displayInfo unless definition_to == nil
  #   str += " :: "
  #   str += term unless term == nil
  #   return str
  # end

end


# == Schema Info
#
# Table name: full_synonyms
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  term           :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)