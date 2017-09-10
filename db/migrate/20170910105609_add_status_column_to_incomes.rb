class AddStatusColumnToIncomes < ActiveRecord::Migration[5.0]
  def change
  	add_column :incomes, :status, :integer
  end
end
