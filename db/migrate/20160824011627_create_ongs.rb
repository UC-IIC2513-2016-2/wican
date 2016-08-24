class CreateOngs < ActiveRecord::Migration[5.0]
  def change
    create_table :ongs do |t|
      t.string :name, null: false
      t.string :logo
      t.string :email
      t.string :description, null: false
      t.string :webpage

      t.timestamps
    end
    add_index :ongs, :name
  end
end
