class MajorDialect < ActiveRecord::Base
  has_many :specific_dialects, :foreign_key => "major_dialect_id"

  def displayInfo
    str = ""
    str += name unless name == nil
    return str
  end
end
