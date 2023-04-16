# frozen_string_literal: true

class CreateRestrictions < ActiveRecord::Migration[7.0]
  def change
    create_table :restrictions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
