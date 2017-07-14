class CreatePayees < ActiveRecord::Migration[5.0]
  def change
    create_table :payees do |t|
      t.string :code
      t.string :name
      t.string :brief_name
      t.integer :status

      t.timestamps
    end
    add_index :payees, :code
  end
end
