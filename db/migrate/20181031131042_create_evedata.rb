class CreateEvedata < ActiveRecord::Migration[5.2]
  def change
    create_table :evedata do |t|
      t.string :title
      t.string :date
      t.string :place
      t.string :event
      t.string :description

      t.timestamps
    end
  end
end
