class AddMarksToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :marks, :float, null: false, default: 1
  end
end
