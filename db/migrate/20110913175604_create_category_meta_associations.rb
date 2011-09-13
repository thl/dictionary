class CreateCategoryMetaAssociations < ActiveRecord::Migration
  def self.up
    create_table :category_meta_associations do |t|
      t.integer :meta_id
      t.integer :category_branch_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_meta_associations
  end
end
