# frozen_string_literal: true

class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.references :agent, null: false, foreign_key: true
      t.string :feild

      t.timestamps
    end
  end
end
