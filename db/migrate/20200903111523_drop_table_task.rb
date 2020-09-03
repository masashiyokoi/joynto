class DropTableTask < ActiveRecord::Migration[5.2]
  def change
    drop_table :tasks do |t|
      t.string :name
      t.integer :scope
      t.string :category
      t.integer :priority
      t.integer :importance
      t.integer :urgency
      t.integer :status
      t.datetime :due_date

      t.timestamps
    end
  end
end
