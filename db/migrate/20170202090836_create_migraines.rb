class CreateMigraines < ActiveRecord::Migration[5.0]
  def change
    create_table :migraines do |t|
      t.string :date
      t.integer :severity
      t.integer :phen_level

      t.timestamps
    end
  end
end
