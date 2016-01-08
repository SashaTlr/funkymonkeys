class CreateOptionsQuestions < ActiveRecord::Migration
  def change
    create_table :options_questions do |t|
      t.integer :option_id, null: false
      t.integer :question_id, null: false

      t.timestamps, null: false
    end
  end
end
