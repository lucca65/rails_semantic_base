class CreateAdminUsersTransactions < ActiveRecord::Migration
  def change
    create_table :admin_user_transaction_types do |t|
      t.belongs_to :admin_user, index: true
      t.belongs_to :transaction_type, index: true
    end
  end
end
