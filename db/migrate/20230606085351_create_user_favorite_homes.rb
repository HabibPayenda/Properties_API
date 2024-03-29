# frozen_string_literal: true

class CreateUserFavoriteHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_favorite_homes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :home, null: false, foreign_key: true

      t.timestamps
    end
  end
end
