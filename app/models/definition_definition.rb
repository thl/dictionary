class DefinitionDefinition < ActiveRecord::Base
  belongs_to :sub_definition, :class_name => "Definition", :foreign_key => "def2_id"
  belongs_to :super_definition, :class_name => "Definition", :foreign_key => "def1_id"  

  def displayInfo
    str = ""
    str += super_definition.displayInfo unless super_definition == nil
    str += " | "
    str += sub_definition.displayInfo unless sub_definition == nil
    return str
  end

  def displaySuperInfo
    str = ""
    str += sub_definition.displayInfo unless sub_definition == nil
    #str += "("+sub_definition.super_definitions.size.to_s+" sub defs)" unless sub_definition == nil
    return str
  end

  def displaySubInfo
    str = ""
    str += super_definition.displayInfo unless super_definition == nil
    return str
  end
  
end
