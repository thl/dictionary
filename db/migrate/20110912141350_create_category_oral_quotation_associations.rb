class CreateCategoryOralQuotationAssociations < ActiveRecord::Migration
  def self.up
    create_table :category_oral_quotation_associations do |t|
      t.integer :oral_quotation_id
      t.integer :category_branch_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_oral_quotation_associations
  end
end
