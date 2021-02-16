class CreateCompletedLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :completed_lessons do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :lesson, null: false, index: true

      t.timestamps
    end
  end
end
