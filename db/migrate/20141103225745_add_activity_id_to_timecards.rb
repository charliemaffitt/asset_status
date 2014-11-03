class AddActivityIdToTimecards < ActiveRecord::Migration
  def change
    add_column :timecards, :activity_id, :integer
    add_index :timecards, :activity_id
  end
end
