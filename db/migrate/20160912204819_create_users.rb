class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.boolean :active
      t.boolean :approved
      t.datetime :last_login

      t.timestamps null: false
    end
  end
end
