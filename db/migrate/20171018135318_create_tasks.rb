class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :deadline
      t.integer :work_time
      t.text :state
      t.date :implementation_scheduled_date
      t.date :complete_scheduled_date

      t.timestamps
    end
  end
end
