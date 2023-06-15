# frozen_string_literal: true

class CreateUserCarViews < ActiveRecord::Migration[7.0]
  def change
    create_table :user_car_views do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
