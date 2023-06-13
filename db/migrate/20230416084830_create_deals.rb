# frozen_string_literal: true

class CreateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.references :deal_info, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
