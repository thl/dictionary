class SpellingSpecificDialect < ActiveRecord::Base
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: spelling_specific_dialects
#
#  id               :integer         not null, primary key
#  major_dialect_id :integer
#  created_by       :string(80)
#  name             :string(80)
#  update_history   :text
#  updated_by       :string(80)
#  created_at       :string(80)
#  updated_at       :string(80)