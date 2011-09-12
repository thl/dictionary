class CreateCategoryTranslationAssociations < ActiveRecord::Migration
  def self.up
    create_table :category_translation_associations do |t|
      t.integer :translation_id
      t.integer :category_branch_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_translation_associations
  end
end
