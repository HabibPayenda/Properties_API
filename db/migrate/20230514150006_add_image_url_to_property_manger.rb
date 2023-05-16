# frozen_string_literal: true

class AddImageUrlToPropertyManger < ActiveRecord::Migration[7.0]
  def change
    add_column :property_managers, :image_url, :text
  end
end
