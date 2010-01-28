class GrammarFunctionLevelOne < ActiveRecord::Base
  has_many :grammar_function_level_twos, :foreign_key => 'grammar_function_id'

  def displayInfo
    str = ""
    str += grammar_function unless grammar_function == nil
    return str
  end

end
