class CreateFeeIncomeLists < ActiveRecord::Migration[5.0]
  def change
    create_table :fee_income_lists do |t|
      t.references :fee, foreign_key: true
      t.references :income, foreign_key: true

      t.timestamps
    end
  end
end
