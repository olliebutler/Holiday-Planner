class AddPicToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :pic, :string
  end
end
