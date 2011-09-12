class CategorySpellingAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :spelling
end
