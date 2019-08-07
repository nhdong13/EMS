class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :password_digest
      t.string :email
      t.string :address
      t.string :phone
      t.boolean :status
      t.integer :create_by
      t.string :role

      t.timestamps
    end
  end
end
