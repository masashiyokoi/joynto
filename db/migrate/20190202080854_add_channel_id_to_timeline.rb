class AddChannelIdToTimeline < ActiveRecord::Migration[5.2]
  def change
    add_column :timelines, :channel_id, :integer
  end
end
