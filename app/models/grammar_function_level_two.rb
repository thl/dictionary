class GrammarFunctionLevelTwo < ActiveRecord::Base
  has_many :grammar_function_level_threes, :foreign_key => 'grammar_function_id'
  belongs_to :grammar_function_level_one, :foreign_key => "grammar_function_id"

  def displayInfo
    str = ""
    str += grammar_function unless grammar_function == nil
    return str
  end
end
