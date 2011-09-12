class DefinitionCategoryAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :definition
end
