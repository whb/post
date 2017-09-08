class CreateRevenues < ActiveRecord::Migration[5.0]
  def change
    create_table :revenues do |t|
      t.references :income, foreign_key: true
      t.date :date
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
