class AllDefinition < ActiveRecord::Base
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: all_definitions
#
#  id                   :integer         primary key
#  definition           :text
#  grammatical_function :string
#  origin               :text
#  term                 :string