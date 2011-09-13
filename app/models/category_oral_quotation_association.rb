class CategoryOralQuotationAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :oral_quotation
end
