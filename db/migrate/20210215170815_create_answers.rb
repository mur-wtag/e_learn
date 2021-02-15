class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :question, null: false, index: true
      t.text :content
      t.string :answered_question_option_ids, array: true, default: []

      t.timestamps
    end
  end
end
