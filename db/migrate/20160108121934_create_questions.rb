class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text, null: false, limit: 512
      t.integer :survey_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
