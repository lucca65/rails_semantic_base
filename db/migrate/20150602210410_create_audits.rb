class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.references :admin_user, index: true
      t.string :action
      t.string :ip

      t.timestamps
    end
  end
end
