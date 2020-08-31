class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.text :address
      t.integer :phone
      t.date :date_of_birth
      t.binary :image



      t.timestamps null: false
    end
  end
end
