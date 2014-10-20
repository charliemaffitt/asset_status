class AddBorrowedOnToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :borrowed_on, :date
  end
end
