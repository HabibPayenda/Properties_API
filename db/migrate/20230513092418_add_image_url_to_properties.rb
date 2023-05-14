class AddImageUrlToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :image_url, :text
  end
end
