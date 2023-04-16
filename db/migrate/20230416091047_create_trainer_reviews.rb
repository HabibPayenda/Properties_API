# frozen_string_literal: true

class CreateTrainerReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :trainer_reviews do |t|
      t.references :agent, null: false, foreign_key: true
      t.references :trainer, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
