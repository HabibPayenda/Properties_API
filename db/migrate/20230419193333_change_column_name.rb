# frozen_string_literal: true

class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :agents, :staus, :status
    add_reference :agents, :admin, null: false, foreign_key: true
    add_column :agents, :hire_date, :date
  end
end
