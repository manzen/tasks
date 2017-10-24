class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.text :url
      t.boolean :delete_flg
      t.integer :user_id
      t.integer :section_id

      t.timestamps
    end
  end
end
