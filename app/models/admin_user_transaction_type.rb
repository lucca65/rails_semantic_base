class AdminUserTransactionType < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :transaction_type, class_name: 'Pay::TransactionType',
                                foreign_key: 'transaction_type_id'

end