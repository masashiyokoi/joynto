class CreateAdvertisements < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.string :image, limit: 1000
      t.integer :sponsor_id
      t.string :link, limit: 1000

      t.timestamps
    end
  end
end
