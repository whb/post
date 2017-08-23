class DropFeeIncomeListsTable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :fee_income_lists
  end
end
