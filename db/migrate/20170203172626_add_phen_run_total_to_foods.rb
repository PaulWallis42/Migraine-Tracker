class AddPhenRunTotalToFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :phen_run_total, :float
  end
end
