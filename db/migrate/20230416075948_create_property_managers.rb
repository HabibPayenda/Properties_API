# frozen_string_literal: true

class CreatePropertyManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :property_managers do |t|
      t.string :name
      t.string :company_name
      t.string :status

      t.timestamps
    end
  end
end
