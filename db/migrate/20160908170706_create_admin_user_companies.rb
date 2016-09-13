class CreateAdminUserCompanies < ActiveRecord::Migration
  def change
    create_table :admin_user_companies do |t|
      t.references :company, index: true, foreign_key: true
      t.references :admin_user, index: true, foreign_key: true
    end
  end
end
