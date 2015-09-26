class Message < ActiveRecord::Base
  enum message_type:  [ :info , :warning, :news ]

  has_many :admin_users, through: :messages_users
  has_many :messages_users

  attr_accessor :to_all
  attr_accessor :users
end
