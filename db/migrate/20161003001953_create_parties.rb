class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.string :name, null: false
      t.string :logo

      t.timestamps
    end
  end
end
