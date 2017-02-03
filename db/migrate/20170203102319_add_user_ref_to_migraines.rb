class AddUserRefToMigraines < ActiveRecord::Migration[5.0]
  def change
    add_reference :migraines, :user, foreign_key: true
  end
end
