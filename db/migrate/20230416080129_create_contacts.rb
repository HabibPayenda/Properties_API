class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :phone_number_one
      t.string :phone_number_two
      t.string :email_one
      t.string :email_two

      t.timestamps
    end
  end
end
