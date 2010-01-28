class ThemeLevelTwo < ActiveRecord::Base
  has_many :theme_level_threes, :foreign_key => 'theme_id'
  belongs_to :theme_level_one, :foreign_key => "theme_id"

  def displayInfo
    str = ""
    str += theme unless theme == nil
    return str
  end
end
