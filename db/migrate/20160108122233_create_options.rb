class CreateOptions < ActiveRecord::Migration
  def change
    create_table :option do |t|
      t.string :text, null: false

      t.timestamps, null: false
    end
  end
end
