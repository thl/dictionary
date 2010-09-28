class AllDefinition < ActiveRecord::Base
end

# == Schema Info
#
# Table name: all_definitions
#
#  id                   :integer         primary key
#  definition           :text
#  grammatical_function :string
#  origin               :text
#  term                 :string