# frozen_string_literal: true

class CreateUserFavoriteCars < ActiveRecord::Migration[7.0]
  def change
    create_table :user_favorite_cars do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
