class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :user_name
      t.integer :event_id
      t.string :body

      t.timestamps
    end
  end
end
