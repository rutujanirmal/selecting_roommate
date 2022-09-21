class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :emp_id, presence: true, unique: true
      t.string :full_name, presence: true
      t.string :gender, presence: true
      t.string :email, presence: true, unique: true
      t.string :phone_no, default: nil
      t.string :role, default: "employee"

      t.timestamps
    end
  end
end
