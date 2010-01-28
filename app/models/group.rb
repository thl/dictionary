class Group < ActiveRecord::Base
  has_one :meta, :foreign_key => 'group_id'

  def displayInfo
    str = ""
    str += group unless group == nil
    return str
  end
end
