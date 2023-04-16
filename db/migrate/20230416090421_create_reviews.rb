class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :type
      t.integer :rating
      t.text :description

      t.timestamps
    end
  end
end
