class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question_content
      t.text :answers
      t.string :correct_answers
      t.boolean :status
      t.integer :subject_id
      t.integer :create_by
      t.integer :type

      t.timestamps
    end
  end
end
