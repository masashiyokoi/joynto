class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :caption
      t.text :detail
      t.text :url
      t.integer :project_id
      t.integer :owner_id
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
  end
end
