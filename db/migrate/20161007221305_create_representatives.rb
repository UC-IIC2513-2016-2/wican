class CreateRepresentatives < ActiveRecord::Migration[5.0]
  def change
    create_table :representatives do |t|
      t.string :type # para STI: http://api.rubyonrails.org/classes/ActiveRecord/Inheritance.html
      t.string :name
      t.string :photo
      t.string :email
      t.references :party, foreign_key: true
      t.references :circumscription, foreign_key: true
      t.references :district, foreign_key: true

      t.timestamps
    end
  end
end
