class AddDeletedToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :deleted, :boolean, default: false
  end
end
