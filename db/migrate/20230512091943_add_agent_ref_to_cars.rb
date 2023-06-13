# frozen_string_literal: true

class AddAgentRefToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :agent, null: false, foreign_key: true
  end
end
