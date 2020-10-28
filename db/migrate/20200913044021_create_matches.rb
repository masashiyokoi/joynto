class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :request_id
      t.string :request_type
      t.integer :accept_id
      t.string :accept_type

      t.timestamps
    end
  end
end
