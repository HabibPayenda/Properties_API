class AddAgentRefToHomeTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :homes, :agent, null: false, foreign_key: true
    add_reference :homes, :property_manager, null: false, foreign_key: true
  end
end
