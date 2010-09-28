class Register < ActiveRecord::Base
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: registers
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  register       :string(80)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)