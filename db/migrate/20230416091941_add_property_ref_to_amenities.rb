class AddPropertyRefToAmenities < ActiveRecord::Migration[7.0]
  def change
    add_reference :amenities, :property, null: false, foreign_key: true
  end
end
