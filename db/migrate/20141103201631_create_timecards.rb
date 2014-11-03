class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.integer :location_id
      t.integer :user_id
      t.datetime :start_time
      t.datetime :stop_time
      t.boolean :published, default: false
      t.timestamps
    end
    add_index :timecards, :user_id
    add_index :timecards, :location_id
  end
end
