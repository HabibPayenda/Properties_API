# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :type
      t.string :name
      t.text :description
      t.string :availability_status

      t.timestamps
    end
  end
end
