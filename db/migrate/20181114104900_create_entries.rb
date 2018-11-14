class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :event_id
      t.integer :user_id
      t.timestamps
    end
  end
end