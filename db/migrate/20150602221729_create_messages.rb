class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :message_type, default: 0

      t.timestamps
    end
  end
end
