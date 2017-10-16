class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :commenter
      t.text :body
      t.integer :group_id

      t.timestamps
    end
  end
end
