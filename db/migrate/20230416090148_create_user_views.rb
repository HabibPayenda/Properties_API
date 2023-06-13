# frozen_string_literal: true

class CreateUserViews < ActiveRecord::Migration[7.0]
  def change
    create_table :user_views do |t|
      t.references :property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.time :time_spent

      t.timestamps
    end
  end
end
