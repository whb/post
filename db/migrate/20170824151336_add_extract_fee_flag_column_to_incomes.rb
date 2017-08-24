class AddExtractFeeFlagColumnToIncomes < ActiveRecord::Migration[5.0]
  def change
  	add_column :incomes, :fee_extracted, :boolean
  end
end
