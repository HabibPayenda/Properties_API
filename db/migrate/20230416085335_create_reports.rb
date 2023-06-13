# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.string :type
      t.integer :rating

      t.timestamps
    end
  end
end
