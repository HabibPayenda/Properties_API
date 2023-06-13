# frozen_string_literal: true

class CreateHomeRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :home_rooms do |t|
      t.integer :width
      t.integer :length
      t.integer :windows
      t.boolean :cup_board
      t.boolean :to_sun
      t.string :color

      t.timestamps
    end
  end
end
