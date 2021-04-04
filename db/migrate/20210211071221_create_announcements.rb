class CreateAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :body
      t.integer :kind
      t.boolean :draft
      t.datetime :published_at

      t.timestamps
    end
  end
end
