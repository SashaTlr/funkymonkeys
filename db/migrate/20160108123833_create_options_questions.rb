class CreateOptionsQuestions < ActiveRecord::Migration
  def change
    create_table :option_questions do |t|
      t.integer :option_id, null: false
      t.integer :question_id, null: false

      t.timestamps null: false
    end
  end
end
