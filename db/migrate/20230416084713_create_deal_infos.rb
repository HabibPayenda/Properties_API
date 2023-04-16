# frozen_string_literal: true

class CreateDealInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :deal_infos do |t|
      t.string :type
      t.integer :duration
      t.integer :price_per_duration
      t.integer :total_price
      t.integer :total_duration
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
