# frozen_string_literal: true

class CreateCarOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :car_offers do |t|
      t.references :car, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
