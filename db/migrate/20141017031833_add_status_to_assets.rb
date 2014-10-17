class AddStatusToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :status, :string
  end
end
