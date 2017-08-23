class AddFeeColumnToIncomes < ActiveRecord::Migration[5.0]
  def change
  	add_column :incomes, :fee_id, :integer
  	add_column :incomes, :fee_amount, :decimal, :precision => 10, :scale => 2
  end
end
