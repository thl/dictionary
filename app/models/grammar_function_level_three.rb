class GrammarFunctionLevelThree < ActiveRecord::Base
  belongs_to :grammar_function_level_two, :foreign_key => "grammar_function_id"

  def displayInfo
    str = ""
    str += grammar_function unless grammar_function == nil
    return str
  end
end
