class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.integer :number, null: false
      t.references :circumscription, foreign_key: true

      t.timestamps
    end
  end
end
