class CreateExamHasQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_has_questions do |t|
      t.integer :exam_id
      t.integer :question_id
      t.integer :mark

      t.timestamps
    end
  end
end
