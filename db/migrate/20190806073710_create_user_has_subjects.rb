class CreateUserHasSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_has_subjects do |t|
      t.integer :user_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
