class SpecificDialect < ActiveRecord::Base
  belongs_to :major_dialect, :foreign_key => "major_dialect_id"

  def displayInfo
    str = ""
    str += name unless name == nil
    return str
  end
end
