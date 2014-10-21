class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.float           :hours, default: 0.0
      t.date            :date, null: false
      t.integer         :user_id, null: false
      t.timestamps
    end

    add_index :activities, :user_id
  end
end
