# frozen_string_literal: true

class CreateAgentReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_reviews do |t|
      t.references :agent, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
