require File.dirname(__FILE__) + '/../test_helper'

class LiteraryGenreTest < Test::Unit::TestCase
  fixtures :literary_genres

  # Replace this with your real tests.
  def test_truth
    assert true
  end
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