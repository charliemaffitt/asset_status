class CreateStartSignals < ActiveRecord::Migration
  def change
    create_table :start_signals do |t|
      t.integer :user_id
      t.integer :location_id
      t.datetime :start_time
      t.timestamps
    end

    add_index :start_signals, :user_id
    add_index :start_signals, :location_id
  end
end
