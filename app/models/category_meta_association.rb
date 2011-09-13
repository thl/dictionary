class CategoryMetaAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :meta
end
