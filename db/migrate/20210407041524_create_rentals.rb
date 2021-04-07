class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.string :rent_property_name
      t.integer :rent
      t.text :address
      t.integer :building_age
      t.text :note

      t.timestamps
    end
  end
end
