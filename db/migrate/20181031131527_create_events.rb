class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :start
      t.string :end
      t.string :place
      t.string :event
      t.integer :num
      t.string :description
      t.string :point

      t.timestamps
    end
  end
end
