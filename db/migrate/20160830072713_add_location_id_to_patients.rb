class AddLocationIdToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :location_id, :integer, null: false, default: 1
    remove_column :patients, :location
  end
end
