class CategoryLiteraryQuotationAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :literary_quotation
end
