class CategoryTranslationEquivalentAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :translation_equivalent
end
