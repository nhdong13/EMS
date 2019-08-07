class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question_content
      t.text :answers
      t.text :correct_answers
      t.boolean :status
      t.integer :subject_id
      t.integer :create_by
      t.string :type

      t.timestamps
    end
  end
end
