class AddChangeOrgIdToOng < ActiveRecord::Migration[5.0]
  def change
    add_column :ongs, :change_org_id, :integer
  end
end
