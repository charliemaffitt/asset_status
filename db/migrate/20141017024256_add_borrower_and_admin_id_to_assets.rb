class AddBorrowerAndAdminIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :borrower_id, :integer
    add_column :assets, :admin_id, :integer
    add_index :assets, :borrower_id
    add_index :assets, :admin_id
  end
end
