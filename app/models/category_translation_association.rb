class CategoryTranslationAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :translation
end
