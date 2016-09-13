class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: {
         male: 'male',
         female: 'female',
         gender_fluid: 'gender_fluid',
         asexual: 'assexual',
         intersex: 'intersex',
         neutral: 'neutral',
         prefer_not_to_disclose: 'prefer_not_to_disclose'
       }

  validates_uniqueness_of :email
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  def update_last_signin
    self.update_attribute('last_login', DateTime.now)
  end
end
