class CreateFeeDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :fee_details do |t|
      t.references :fee, foreign_key: true
      t.references :income, foreign_key: true
      t.decimal :fee_amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
