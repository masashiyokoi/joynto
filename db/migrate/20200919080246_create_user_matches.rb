class CreateUserMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :user_matches do |t|
      t.integer :user_id
      t.integer :match_id
      t.integer :process_type

      t.timestamps
    end
  end
end
