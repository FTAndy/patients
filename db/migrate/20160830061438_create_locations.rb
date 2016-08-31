class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :code, limit: 10, null: false
      t.string :name, limit: 80
    end
  end
end
