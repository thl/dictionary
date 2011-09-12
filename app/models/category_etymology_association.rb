class CategoryEtymologyAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :etymology
end
