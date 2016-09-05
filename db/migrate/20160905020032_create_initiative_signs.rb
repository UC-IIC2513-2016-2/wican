class CreateInitiativeSigns < ActiveRecord::Migration[5.0]
  def change
    create_table :initiative_signs do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :email
      t.references :initiative, foreign_key: true

      t.timestamps

      t.index [:initiative_id, :user_id], unique: true
    end
  end
end
