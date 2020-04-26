class DropTableEmoji < ActiveRecord::Migration[5.2]
  def change
    drop_table :emojis
  end
end
