class CreateAdminContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_contacts do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
