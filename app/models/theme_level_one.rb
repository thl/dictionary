class ThemeLevelOne < ActiveRecord::Base
  has_many :theme_level_twos, :foreign_key => 'theme_id'

  def displayInfo
    str = ""
    str += theme unless theme == nil
    return str
  end
end
