class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.string :code
      t.references :payer, foreign_key: true
      t.string :abstract
      t.date :bill_date
      t.date :account_date
      t.decimal :income_amount, precision: 10, scale: 2
      t.decimal :settlement_amount, precision: 10, scale: 2
      t.date :invoice_date
      t.integer :invoice_num
      t.decimal :tax_rate, precision: 2, scale: 0
      t.string :explain
      t.decimal :discount_rate, precision: 2, scale: 0
      t.decimal :available_amount, precision: 10, scale: 2

      t.timestamps
    end
    add_index :incomes, :code
  end
end
