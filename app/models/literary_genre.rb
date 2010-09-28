class LiteraryGenre < ActiveRecord::Base
  has_many :children, :class_name => 'LiteraryGenre', :foreign_key => 'parent_id'
end

# == Schema Info
# Schema version: 20100924060552
#
# Table name: literary_genres
#
#  id             :integer         not null, primary key
#  parent_id      :integer
#  created_by     :string(80)
#  literary_genre :string(512)
#  update_history :text
#  updated_by     :string(80)
#  created_at     :string(80)
#  updated_at     :string(80)