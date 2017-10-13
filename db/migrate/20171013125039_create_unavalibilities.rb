class CreateUnavalibilities < ActiveRecord::Migration[5.1]
  def change
    create_table :unavalibilities do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.text :message
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
