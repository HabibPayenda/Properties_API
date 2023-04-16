# frozen_string_literal: true

class CreateAgentContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_contacts do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
