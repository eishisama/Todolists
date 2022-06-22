class CreateMonthTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :month_tasks do |t|
      t.text :name
      t.text :content
      t.integer :user_id
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
