class CreateStopSignals < ActiveRecord::Migration
  def change
    create_table :stop_signals do |t|
      t.integer :start_signal_id
      t.datetime :stop_time
      t.timestamps
    end
  end
end
