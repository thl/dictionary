class GrammarFunctionLevelTwo < ActiveRecord::Base
  has_many :grammar_function_level_threes, :foreign_key => 'grammar_function_id'
  belongs_to :grammar_function_level_one, :foreign_key => "grammar_function_id"

  def displayInfo
    str = ""
    str += grammar_function unless grammar_function == nil
    return str
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: grammar_function_level_twos
#
#  id                  :integer         not null, primary key
#  grammar_function_id :integer
#  created_by          :string(80)
#  grammar_function    :string(128)
#  update_history      :text
#  updated_by          :string(80)
#  created_at          :string(80)
#  updated_at          :string(80)