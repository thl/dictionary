class Script < ActiveRecord::Base
end


# == Schema Info
#
# Table name: scripts
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  script         :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)