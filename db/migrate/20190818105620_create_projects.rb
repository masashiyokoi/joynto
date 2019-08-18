class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :detail
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :owner_id

      t.timestamps
    end
  end
end
