# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.date :date_of_birth
      t.string :gender
      t.string :push_token
      t.datetime :last_login

      t.timestamps
    end
  end
end
