class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :cost, foreign_key: true
      t.date :date
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
