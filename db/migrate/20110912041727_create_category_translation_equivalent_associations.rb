class CreateCategoryTranslationEquivalentAssociations < ActiveRecord::Migration
  def self.up
    create_table :category_translation_equivalent_associations do |t|
      t.integer :translation_equivalent_id
      t.integer :category_branch_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_translation_equivalent_associations
  end
end
