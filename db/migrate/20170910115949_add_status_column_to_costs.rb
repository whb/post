class AddStatusColumnToCosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :costs, :status, :integer
  end
end
