# frozen_string_literal: true

class AddAgentRefToLands < ActiveRecord::Migration[7.0]
  def change
    add_reference :lands, :agent, null: false, foreign_key: true
    add_reference :lands, :property_manager, null: false, foreign_key: true
  end
end
