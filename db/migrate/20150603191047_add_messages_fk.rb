class AddMessagesFk < ActiveRecord::Migration
  def change
    add_foreign_key :messages_users, :admin_users
  end
end
