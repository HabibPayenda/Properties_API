# frozen_string_literal: true

class AddAgentRefToPropertyManagers < ActiveRecord::Migration[7.0]
  def change
    add_reference :property_managers, :agent, null: false, foreign_key: true
  end
end
