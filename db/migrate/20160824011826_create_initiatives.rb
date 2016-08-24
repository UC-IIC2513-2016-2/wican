class CreateInitiatives < ActiveRecord::Migration[5.0]
  def change
    create_table :initiatives do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :image
      t.boolean :active, default: false
      t.string :hashtag
      t.references :ong, foreign_key: true

      t.timestamps
    end
  end
end
