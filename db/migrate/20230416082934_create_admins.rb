# frozen_string_literal: true

class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :password
      t.string :role
      t.string :status
      t.datetime :last_login_at
      t.string :last_login_ip

      t.timestamps
    end
  end
end
