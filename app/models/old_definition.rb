class OldDefinition < ActiveRecord::Base
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: old_definitions
#
#  id                   :integer         not null, primary key
#  thdl_id              :integer
#  created_by           :string(80)
#  definition           :text
#  dictionary           :string(256)
#  grammatical_function :string(512)     default("")
#  level                :string(80)
#  notes                :text
#  term                 :string(256)
#  update_history       :text
#  updated_by           :string(80)
#  url                  :string(256)
#  created_at           :string(80)
#  updated_at           :string(80)