# frozen_string_literal: true

class CreateAmenities < ActiveRecord::Migration[7.0]
  def change
    create_table :amenities do |t|
      t.string :name
      t.text :description
      t.integer :fee
      t.string :fee_duration

      t.timestamps
    end
  end
end
