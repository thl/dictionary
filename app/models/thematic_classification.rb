class ThematicClassification < ActiveRecord::Base
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: thematic_classifications
#
#  id             :integer         not null, primary key
#  created_by     :string(80)
#  level1         :string(128)
#  level2         :string(128)
#  level3         :string(128)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)