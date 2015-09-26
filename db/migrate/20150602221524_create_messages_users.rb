class CreateMessagesUsers < ActiveRecord::Migration
  def change
    create_table :messages_users do |t|
      t.integer :message_id
      t.integer :admin_user_id
      t.boolean :visualized, default: false

      t.timestamps
    end
  end
end
