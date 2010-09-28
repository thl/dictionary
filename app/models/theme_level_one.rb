class ThemeLevelOne < ActiveRecord::Base
  has_many :theme_level_twos, :foreign_key => 'theme_id'

  def displayInfo
    str = ""
    str += theme unless theme == nil
    return str
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: theme_level_ones
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  theme          :string(128)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)