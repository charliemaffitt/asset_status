class AddNotesToTimecards < ActiveRecord::Migration
  def change
    add_column :timecards, :notes, :text
  end
end
