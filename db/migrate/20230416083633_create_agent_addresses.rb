# frozen_string_literal: true

class CreateAgentAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_addresses do |t|
      t.references :address, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
