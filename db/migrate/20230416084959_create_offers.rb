class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.date :start_date
      t.date :end_date
      t.string :title
      t.text :description
      t.references :deal_info, null: false, foreign_key: true
      t.integer :offer_price
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
