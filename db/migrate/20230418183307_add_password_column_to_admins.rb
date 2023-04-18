# frozen_string_literal: true

class AddPasswordColumnToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :password, :string
  end
end
