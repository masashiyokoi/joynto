class CreateTimelines < ActiveRecord::Migration[5.2]
  def change
    create_table :timelines do |t|
      t.string :type
      t.text :content

      t.timestamps
    end
  end
end
