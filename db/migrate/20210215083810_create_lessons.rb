class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.belongs_to :course, null: false, index: true
      t.string :name, null: false
      t.text :content

      t.timestamps
    end
  end
end
