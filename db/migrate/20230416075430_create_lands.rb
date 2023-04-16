class CreateLands < ActiveRecord::Migration[7.0]
  def change
    create_table :lands do |t|
      t.integer :area
      t.string :zone
      t.string :current_use

      t.timestamps
    end
  end
end
