class CreateTimesMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :times_messages do |t|
      t.integer :user_id
      t.text :content
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end
