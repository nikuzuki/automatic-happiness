class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :owner_id
      t.string :name
      t.string :place
      t.datetime :start_time
      t.datetime :end_time
      t.text :content

      t.timestamps
    end
  end
end
