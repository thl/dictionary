class CreateDefinitionCategoryAssociations < ActiveRecord::Migration
  def self.up
    create_table :definition_category_associations do |t|
      t.integer :definition_id
      t.integer :category_branch_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :definition_category_associations
  end
end
