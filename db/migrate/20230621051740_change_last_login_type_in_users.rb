class ChangeLastLoginTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :last_login, :string
  end
end
