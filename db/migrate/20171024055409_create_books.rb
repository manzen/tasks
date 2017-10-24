class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :url
      t.integer :readed_page
      t.integer :user_id
      t.integer :section_id

      t.timestamps
    end
  end
end
