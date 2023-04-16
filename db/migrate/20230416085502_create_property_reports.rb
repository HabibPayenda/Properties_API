# frozen_string_literal: true

class CreatePropertyReports < ActiveRecord::Migration[7.0]
  def change
    create_table :property_reports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
