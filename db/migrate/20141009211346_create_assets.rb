class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.timestamps
      t.integer :asset_type_id
    end
  end
end
