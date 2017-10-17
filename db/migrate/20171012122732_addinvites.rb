class Addinvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
     t.integer :group_id
     t.string :email
     t.integer :sender_id
     t.integer :recipient_id
     t.string :token
     t.timestamps
    end
  end
end
