class Source < ActiveRecord::Base
  
  has_and_belongs_to_many :metas, :join_table => 'meta_source', :foreign_key => 'source_id', :association_foreign_key => 'meta_id'

end
