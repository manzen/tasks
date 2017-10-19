class AddPrioriryIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :priority_id, :integer
  end
end
