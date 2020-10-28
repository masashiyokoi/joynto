class RenameDirectMessageToMatchMessage < ActiveRecord::Migration[5.2]
  def change
    rename_table :direct_messages, :match_messages
  end
end
