class CreateDirectMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :direct_messages do |t|
      t.integer :match_id
      t.integer :user_id
      t.text :content
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end
