class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.belongs_to :lesson, null: false, index: true
      t.integer :question_type, null: false, default: 0
      t.text :content, null: false

      t.timestamps
    end
  end
end
