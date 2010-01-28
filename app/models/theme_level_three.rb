class ThemeLevelThree < ActiveRecord::Base
  belongs_to :theme_level_two, :foreign_key => "theme_id"

  def displayInfo
    str = ""
    str += theme unless theme == nil
    return str
  end
end
