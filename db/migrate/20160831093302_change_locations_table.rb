class ChangeLocationsTable < ActiveRecord::Migration
  def change
    change_column :locations, :code, :string, null: true
  end
end
