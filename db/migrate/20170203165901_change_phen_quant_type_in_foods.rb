class ChangePhenQuantTypeInFoods < ActiveRecord::Migration[5.0]
  def change
    change_column :foods, :phen_quant, :float
  end
end
