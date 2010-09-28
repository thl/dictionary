class AddRootLetterIdToDefinition < ActiveRecord::Migration
  def self.up
    add_column :definitions, :root_letter_id, :integer
    Definition.reset_column_information
    
    last_root_letter_str = nil
    root_letter = nil
    Definition.all(:conditions => ['level = ? AND wylie IS NOT NULL', 'head term'], :order => 'sort_order').each do |definition|
      root_letter_str = definition.wylie.base_letter('bod')
      next if root_letter_str.nil?
      if last_root_letter_str != root_letter_str
        last_root_letter_str = root_letter_str
        root_letter = ComplexScripts::TibetanLetter.find_by_wylie(root_letter_str)
        next if root_letter.nil?
      end
      definition.update_attribute(:root_letter, root_letter)
    end
  end

  def self.down
    remove_column :definitions, :root_letter_id
  end
end
