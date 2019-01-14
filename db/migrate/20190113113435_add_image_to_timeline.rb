class AddImageToTimeline < ActiveRecord::Migration[5.2]
  def change
    add_column :timelines, :image, :string, after: :content
  end
end
