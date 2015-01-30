class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.text :adress
      t.float :latitude
      t.float :longitude
      t.integer :phonenumber
      t.string :sex
      t.string :specialism
      t.string :email
      t.date :dob

      t.timestamps
    end
  end
end
