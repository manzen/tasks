class AddSectionIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :section_id, :integer
  end
end
