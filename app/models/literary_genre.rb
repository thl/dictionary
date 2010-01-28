class LiteraryGenre < ActiveRecord::Base
  has_many :children, :class_name => 'LiteraryGenre', :foreign_key => 'parent_id'
end
