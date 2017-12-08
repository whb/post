class ChangeIncomeExplainColumnToText < ActiveRecord::Migration[5.0]
  def change
		change_column :incomes, :explain, :text
  end
end
