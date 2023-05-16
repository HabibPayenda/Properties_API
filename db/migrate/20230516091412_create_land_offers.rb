class CreateLandOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :land_offers do |t|
      t.references :land, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
