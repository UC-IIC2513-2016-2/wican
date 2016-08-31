class CreateJoinTableOngsUsers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :ongs, :users do |t|
      t.index [:user_id, :ong_id]
    end
  end
end
