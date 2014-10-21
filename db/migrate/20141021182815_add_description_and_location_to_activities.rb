class AddDescriptionAndLocationToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :description, :text
    add_column :activities, :location_id, :integer
    add_column :activities, :travel_hours, :float, default: 0.0
    add_index :activities, :location_id
  end
end
