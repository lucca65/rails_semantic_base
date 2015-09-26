class MessagesUser < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :message
end
