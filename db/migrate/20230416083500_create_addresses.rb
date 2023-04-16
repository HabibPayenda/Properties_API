# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :province
      t.string :city
      t.string :district
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
