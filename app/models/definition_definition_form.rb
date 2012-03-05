class DefinitionDefinitionForm < ActiveRecord::Base
  belongs_to :definition_to, :class_name => "Definition", :foreign_key => "def2_id"
  belongs_to :definition_from, :class_name => "Definition", :foreign_key => "def1_id"
  has_one :meta, :foreign_key => 'definition_definition_form_id'

  def displayInfo
    str = ""
    str += definition_from.displayInfo unless definition_from == nil
    str += " | "
    str += role unless role == nil
    str += " | "
    str += definition_to.displayInfo unless definition_to == nil
    return str
  end

  def displayToInfo
    str = ""
    str += definition_from.displayInfo unless definition_from == nil
    str += " | "
    str += role unless role == nil
    return str
  end

  def displayFromInfo
    str = ""
    str += definition_to.displayInfo unless definition_to == nil
    str += " | "
    str += role unless role == nil
    return str
  end

  def displayToTerm
    str = ""
    str += definition_from.term unless definition_from == nil or definition_from.term == nil
    return str
  end

  def displayFromTerm
    str = ""
    str += definition_to.term unless definition_to == nil or definition_to.term == nil
    return str
  end

  def displayToInfoPublic
    str = ""
    str += relationship_from unless relationship_from == nil
    # str += "&nbsp;"
    # str += definition_from.displayInfoPublicBasic unless definition_from == nil
    return str
  end

  def displayFromInfoPublic
    str = ""
    if relationship_to == 'future form' then
      str += "future tense"
    else
      if relationship_to == 'imperative form' then
       str += "imperative tense"
      else
        str += relationship_to unless relationship_to == nil
      end
    end
    
    # str += "&nbsp;"
    # str += definition_to.displayInfoPublicBasic unless definition_to == nil
    return str
  end

end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: definition_definition_forms
#
#  id                :integer         not null, primary key
#  def1_id           :integer
#  def2_id           :integer
#  created_by        :string(80)
#  relationship_from :string(256)
#  relationship_to   :string(256)
#  role              :string(128)
#  update_history    :text
#  updated_by        :string(80)
#  created_at        :string(80)
#  updated_at        :string(80)