class CreateCategoryEtymologyAssociations < ActiveRecord::Migration
  def self.up
    create_table :category_etymology_associations do |t|
      t.integer :etymology_id
      t.integer :category_branch_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_etymology_associations
  end
end
