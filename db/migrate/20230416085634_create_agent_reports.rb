# frozen_string_literal: true

class CreateAgentReports < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_reports do |t|
      t.references :report, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
