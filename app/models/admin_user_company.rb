class AdminUserCompany < ActiveRecord::Base
  belongs_to :user, autosave: true
  belongs_to :company, autosave: true
end
