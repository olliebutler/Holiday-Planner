class Fixedunavalibility < ActiveRecord::Migration[5.1]
  def change
    create_table :unavalibilities do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.references :group, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
