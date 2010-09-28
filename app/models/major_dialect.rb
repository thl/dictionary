class MajorDialect < ActiveRecord::Base
  has_many :specific_dialects, :foreign_key => "major_dialect_id"

  def displayInfo
    str = ""
    str += name unless name == nil
    return str
  end
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: major_dialects
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  name           :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)