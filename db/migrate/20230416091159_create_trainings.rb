# frozen_string_literal: true

class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :description
      t.string :duration

      t.timestamps
    end
  end
end
