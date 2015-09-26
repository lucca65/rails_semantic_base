class Audit < ActiveRecord::Base
  has_one :admin_user
end
