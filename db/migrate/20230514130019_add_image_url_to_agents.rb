# frozen_string_literal: true

class AddImageUrlToAgents < ActiveRecord::Migration[7.0]
  def change
    add_column :agents, :image_url, :text
  end
end
