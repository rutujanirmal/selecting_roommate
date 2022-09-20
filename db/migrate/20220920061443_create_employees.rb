class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :full_name, null: false
      t.string :emp_id, null: false, unique: true
      t.string :email
      t.string :gender, null: false
      t.integer :role , default: 0
      
      t.timestamps
    end
  end
end
