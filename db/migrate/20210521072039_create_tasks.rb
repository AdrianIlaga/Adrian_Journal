class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.string :priority
      t.integer :category_id

      t.timestamps
    end
  end
end
