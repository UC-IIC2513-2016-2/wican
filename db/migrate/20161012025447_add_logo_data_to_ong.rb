class AddLogoDataToOng < ActiveRecord::Migration[5.0]
  def change
    add_column :ongs, :logo_data, :text
  end
end
