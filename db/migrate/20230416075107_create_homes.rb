# frozen_string_literal: true

class CreateHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :homes do |t|
      t.string :owner_name

      t.timestamps
    end
  end
end
