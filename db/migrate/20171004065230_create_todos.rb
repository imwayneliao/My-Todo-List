class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.date :due_date
      t.text :note
      t.timestamps
    end
  end
end
