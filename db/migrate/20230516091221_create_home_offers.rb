# frozen_string_literal: true

class CreateHomeOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :home_offers do |t|
      t.references :home, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
