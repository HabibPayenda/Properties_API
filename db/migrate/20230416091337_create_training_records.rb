class CreateTrainingRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :training_records do |t|
      t.integer :score
      t.references :trainer, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.references :training, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
