class Group < ActiveRecord::Base
  has_one :meta, :foreign_key => 'group_id'

  def displayInfo
    str = ""
    str += group unless group == nil
    return str
  end
end


# == Schema Info
#
# Table name: groups
#
#  id              :integer         not null, primary key
#  analytical_note :string(512)
#  created_by      :string(80)
#  group_name      :string(80)
#  update_history  :text
#  updated_by      :string(80)
#  created_at      :string(80)
#  updated_at      :string(80)