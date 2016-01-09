class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
      t.integer :survey_id, null: false
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.integer :option_id, null: false
      t.timestamps null: false
    end
  end
end
