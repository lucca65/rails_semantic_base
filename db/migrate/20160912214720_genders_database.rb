class GendersDatabase < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TYPE gender AS ENUM ('male', 'female', 'gender_fluid', 'asexual', 'intersex', 'neutral', 'prefer_not_to_disclose');
    SQL

    add_column :users, :gender, :gender, index: true
  end

  def down
    remove_column :users, :gender

    execute <<-SQL
      DROP TYPE gender;
    SQL
  end
end
