# frozen_string_literal: true

class AddHomeRefToHomeRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :home_rooms, :home, null: false, foreign_key: true
  end
end
