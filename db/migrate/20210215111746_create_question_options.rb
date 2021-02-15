class CreateQuestionOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :question_options do |t|
      t.belongs_to :question, null: false, index: true
      t.text :content, null: false
      t.boolean :correct_answer, null: false, default: false

      t.timestamps
    end
  end
end
