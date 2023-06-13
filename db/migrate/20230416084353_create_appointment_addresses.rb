# frozen_string_literal: true

class CreateAppointmentAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :appointment_addresses do |t|
      t.references :address, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
