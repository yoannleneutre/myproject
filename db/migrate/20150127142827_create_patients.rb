class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.text :adress
      t.integer :phonenumber
      t.string :sex
      t.string :email
      t.date :dob

      t.timestamps
    end
  end
end
