class CreateCategoryModelSentenceAssociations < ActiveRecord::Migration
  def self.up
    create_table :category_model_sentence_associations do |t|
      t.integer :model_sentence_id
      t.integer :category_branch_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_model_sentence_associations
  end
end
