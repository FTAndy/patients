class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name, null: false, limit: 30
      t.string :middle_name, limit: 10
      t.string :last_name, null: false, limit: 30
      t.date :date_of_birth
      t.string :gender
      t.string :status, null: false
      t.string :location, null: false
      t.integer :viewed_count
    end
  end
end
