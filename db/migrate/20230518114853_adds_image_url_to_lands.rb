# frozen_string_literal: true

class AddsImageUrlToLands < ActiveRecord::Migration[7.0]
  def change
    add_column :lands, :image_url, :text
  end
end
