class CreateCategoryPronunciationAssociations < ActiveRecord::Migration
  def self.up
    create_table :category_pronunciation_associations do |t|
      t.integer :pronunciation_id
      t.integer :category_branch_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_pronunciation_associations
  end
end
