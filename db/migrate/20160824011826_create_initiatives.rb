class CreateInitiatives < ActiveRecord::Migration[5.0]
  def change
    create_table :initiatives do |t|
      t.string :title
      t.string :description
      t.string :image
      t.boolean :active
      t.string :hashtag
      t.references :ong, foreign_key: true

      t.timestamps
    end
  end
end
