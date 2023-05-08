class ChangeHomeRoomsRelation < ActiveRecord::Migration[7.0]
  def change
      change_column :home_rooms, :home_id, :integer, on_delete: :cascade, foreign_key: true, null: false
  end
end