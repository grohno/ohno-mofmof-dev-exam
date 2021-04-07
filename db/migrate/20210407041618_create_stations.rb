class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :route_name
      t.string :station_name
      t.integer :walk_fraction
      t.references :rental, foreign_key: true

      t.timestamps
    end
  end
end
