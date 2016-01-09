class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name, null: false, unique: true, limit: 50
      t.string :description, null: false, limit: 128
      t.integer :creator_id, index: true
      t.timestamps null: false
    end
  end
end
