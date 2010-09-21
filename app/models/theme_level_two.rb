class ThemeLevelTwo < ActiveRecord::Base
  has_many :theme_level_threes, :foreign_key => 'theme_id'
  belongs_to :theme_level_one, :foreign_key => "theme_id"

  def displayInfo
    str = ""
    str += theme unless theme == nil
    return str
  end
end


# == Schema Info
#
# Table name: theme_level_twos
#
#  id             :integer         not null, primary key
#  theme_id       :integer
#  created_by     :string(80)
#  theme          :string(128)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)