class AddPropertyManagerAndAgentToProperties < ActiveRecord::Migration[7.0]
  def change
    add_reference :properties, :property_manager, null: false, foreign_key: true
    add_reference :properties, :agent, null: false, foreign_key: true
  end
end
