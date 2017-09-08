class DeleteFeeColumnsFromIncomes < ActiveRecord::Migration[5.0]
  def change
  	remove_column :incomes, :fee_id
  	remove_column :incomes, :fee_amount
  	remove_column :incomes, :fee_extracted
  end
end
