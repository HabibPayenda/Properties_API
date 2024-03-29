# frozen_string_literal: true

class CreateAdminAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_addresses do |t|
      t.references :address, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
