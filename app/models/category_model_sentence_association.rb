class CategoryModelSentenceAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :model_sentence
end
