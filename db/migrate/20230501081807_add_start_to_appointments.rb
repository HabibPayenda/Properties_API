class AddStartToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :start, :datetime
    add_column :appointments, :end, :datetime
  end
end
