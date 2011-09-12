class CategoryPronunciationAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :pronunciation
end
