class CreateTraineeAnswerSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :trainee_answer_sheets do |t|
      t.datetime :start_time
      t.datetime :finish_time
      t.boolean :status
      t.integer :total_mark
      t.text :answer_sheet
      t.integer :exam_id
      t.integer :trainee_id
      t.boolean :is_passed

      t.timestamps
    end
  end
end
