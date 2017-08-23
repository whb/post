class DropFeeDetailsTable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :fee_details
  end
end
