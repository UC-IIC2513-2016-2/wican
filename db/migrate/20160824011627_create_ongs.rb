class CreateOngs < ActiveRecord::Migration[5.0]
  def change
    create_table :ongs do |t|
      t.string :name
      t.string :logo
      t.string :email
      t.string :description
      t.string :webpage

      t.timestamps
    end
    add_index :ongs, :name
  end
end
