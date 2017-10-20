class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :title
      t.text :body
      t.integer :admin

      t.timestamps
    end
  end
end
