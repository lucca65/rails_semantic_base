class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable

  has_many :admin_user_transaction_types
  has_many :messages, through: :messages_users
  has_many :messages_users

  # has_many :transaction_types, through: :admin_user_transaction_types
  validates :password, length: { in: 6..64 }, on: :create
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates_confirmation_of :password

  def transaction_types
    self.admin_user_transaction_types.map{|admin_user_transaction_type|
      admin_user_transaction_type.transaction_type
    }
  end

  def update_tracked_fields!(request)
    old_signin = self.last_sign_in_at
    super
    if self.last_sign_in_at != old_signin
      Audit.create :admin_user_id => self.id, :action => 'login', :ip => self.last_sign_in_ip
    end
  end

end
