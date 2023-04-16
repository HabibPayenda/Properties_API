class CreatePropertyManagerReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :property_manager_reviews do |t|
      t.references :agent, null: false, foreign_key: true
      t.references :property_manager, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
