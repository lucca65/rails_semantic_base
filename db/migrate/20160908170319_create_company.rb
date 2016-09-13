class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :document
      t.string :address
      t.string :address_number
      t.string :address_complement
      t.string :address_neighborhood
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :avatar
      t.decimal :lat
      t.decimal :lng
      t.boolean :status
      t.string :facebook_id

      t.timestamps
    end
    add_index :companies, :email, unique: true
  end
end
