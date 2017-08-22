class CreateFees < ActiveRecord::Migration[5.0]
  def change
    create_table :fees do |t|
      t.date :begin_date
      t.date :end_date
      t.decimal :income_amount, precision: 10, scale: 2
      t.decimal :fee_amount, precision: 10, scale: 2
      t.decimal :part_amount1, precision: 10, scale: 2
      t.decimal :percent1, precision: 3, scale: 1
      t.decimal :part_amount2, precision: 10, scale: 2
      t.decimal :percent2, precision: 3, scale: 1

      t.timestamps
    end
  end
end
