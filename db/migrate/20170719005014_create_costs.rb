class CreateCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :costs do |t|
      t.string :no
      t.references :payee, foreign_key: true
      t.references :income, foreign_key: true
      t.string :abstract
      t.date :invoice_date
      t.decimal :tax_rate, precision: 2, scale: 0
      t.decimal :invoice_amount, precision: 10, scale: 2
      t.date :cost_date
      t.decimal :cost_amount, precision: 10, scale: 2
      t.string :explain

      t.timestamps
    end
    add_index :costs, :no
  end
end
