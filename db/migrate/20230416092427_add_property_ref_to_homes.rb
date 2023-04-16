class AddPropertyRefToHomes < ActiveRecord::Migration[7.0]
  def change
    add_reference :homes, :property, null: false, foreign_key: true
  end
end
