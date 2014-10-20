class AddDefaultValueToAssetsValue < ActiveRecord::Migration
  def up
    change_column :assets, :value, :float, default: 0.0
  end

  def down
    change_column :assets, :value, :float
  end
end
