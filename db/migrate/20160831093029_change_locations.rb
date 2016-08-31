class ChangeLocations < ActiveRecord::Migration
  def change
    change_column :locations, :name, :string, null: false
    change_column :locations, :code, :string, null: true
  end
end
