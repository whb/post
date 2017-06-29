class CreatePayers < ActiveRecord::Migration[5.0]
  def change
    create_table :payers do |t|
      t.string :code
      t.string :name
      t.string :brief_name
      t.integer :status

      t.timestamps
    end
  end
end
