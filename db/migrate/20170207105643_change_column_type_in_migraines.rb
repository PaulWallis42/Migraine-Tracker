class ChangeColumnTypeInMigraines < ActiveRecord::Migration[5.0]
  def change
    change_column :migraines, :phen_level, :float
  end
end
