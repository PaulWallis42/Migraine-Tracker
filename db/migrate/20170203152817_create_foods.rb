class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :food_quant
      t.integer :phen_quant

      t.timestamps
    end
  end
end
