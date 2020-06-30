class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :description
      t.boolean :status
      t.integer :create_by

      t.timestamps
    end
  end
end
