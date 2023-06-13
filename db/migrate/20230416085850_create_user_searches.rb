# frozen_string_literal: true

class CreateUserSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :user_searches do |t|
      t.references :user, null: false, foreign_key: true
      t.text :term

      t.timestamps
    end
  end
end
