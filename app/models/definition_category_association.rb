class DefinitionCategoryAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :definition
  
  #FIXED = [ 119, 184, 185, 186, 187, 190, 272, 286, 638 ]
  #drop_downs: 184(language), 185(language_context),187(literary_period), 186(literary_form), 190(register)
  #FIXED = {286 => 'grammatical_function_associations', 272 => 'subject_associations', 119 => 'literary_genre_associations', 638 => 'major_dialect_family_associations' }
  FIXED = {286 => 'grammatical_function_associations', 119 => 'literary_genre_associations', 638 => 'major_dialect_family_associations' }

  def category_stack
    stack = []
    #stack << self.label if !label.blank? && self.prefix_label
    stack << self.category_branch_id.title #if self.show_root?
    #stack << self.category.parent.title if self.show_parent?
    stack << self.category.title
    #stack.last << " #{self.label}" if !label.blank? && !self.prefix_label
    stack
  end
  
  def stacked_category
    return category_stack.join(' > ')
  end
  
  def category
    Category.find(self.category_id)
  end
  
  def root
    Category.find(self.category_branch_id)
  end
end
