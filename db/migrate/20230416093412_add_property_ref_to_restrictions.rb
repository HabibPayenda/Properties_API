class AddPropertyRefToRestrictions < ActiveRecord::Migration[7.0]
  def change
    add_reference :restrictions, :property, null: false, foreign_key: true
  end
end
