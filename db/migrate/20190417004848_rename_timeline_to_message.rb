class RenameTimelineToMessage < ActiveRecord::Migration[5.2]
  def change
    rename_table :timelines, :messages
  end
end
