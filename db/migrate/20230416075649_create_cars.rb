class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.integer :mile_age
      t.string :transmission
      t.string :fuel_type
      t.integer :engine_size
      t.string :body_style
      t.integer :identity_number

      t.timestamps
    end
  end
end
