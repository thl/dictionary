class Source < ActiveRecord::Base
  
  has_and_belongs_to_many :metas, :join_table => 'meta_source', :foreign_key => 'source_id', :association_foreign_key => 'meta_id'

end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: sources
#
#  id                :integer         not null, primary key
#  created_by        :string(80)
#  end_line_number   :string(128)
#  end_page_number   :string(128)
#  end_page_side     :string(128)
#  page_number       :string(256)
#  source_id_value   :string(256)
#  source_note       :text
#  source_type       :string(256)
#  spelling          :string(512)
#  start_line_number :string(128)
#  start_page_side   :string(128)
#  update_history    :text
#  updated_by        :string(80)
#  volume_number     :string(128)
#  created_at        :string(80)
#  updated_at        :string(80)