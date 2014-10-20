class AddModelFieldsAndValueToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :brand, :string
    add_column :assets, :model, :string
    add_column :assets, :value, :float
    add_column :assets, :serial_number, :string
  end
end
