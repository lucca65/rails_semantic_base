class AddCommentsOnUserGender < ActiveRecord::Migration
  def change
    execute "COMMENT ON COLUMN users.gender IS 'Avaliable genders: male: 0, female: 1, gender_fluid: 2, asexual: 3, intersex: 4, neutral: 5, prefer_not_to_disclose: 6'"
  end
end
