class CreateEmojis < ActiveRecord::Migration[5.2]
  def change
    create_table :emojis do |t|
      t.string :name
      t.string :image
      t.string :vote_scope

      t.timestamps
    end
  end
end
