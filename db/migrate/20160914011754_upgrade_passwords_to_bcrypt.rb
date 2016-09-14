class UpgradePasswordsToBcrypt < ActiveRecord::Migration[5.0]
  def up
    User.find_each do |user|
      user.password = user.read_attribute(:password)
      user.save
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
