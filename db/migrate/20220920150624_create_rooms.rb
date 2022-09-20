class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :booked_by
      t.string :roommates, array: true

      t.timestamps
    end
  end
end
