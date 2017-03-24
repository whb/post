class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :displayname
      t.string :password_digest
      t.boolean :enabled
      t.integer :organization_id

      t.timestamps
    end
  end
end
