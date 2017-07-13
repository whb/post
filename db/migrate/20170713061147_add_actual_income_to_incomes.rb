class AddActualIncomeToIncomes < ActiveRecord::Migration[5.0]
  def change
  	add_column :incomes, :actual_amount, :decimal, :precision => 10, :scale => 2
  	add_column :incomes, :actual_date, :date
  end
end
