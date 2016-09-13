class AdminUser < ActiveRecord::Base
  audited

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable

  has_many :admin_user_transaction_types
  has_many :messages, through: :messages_users
  has_many :messages_users
  has_many :audit
  has_many :admin_user_companies
  has_many :companies, through: :admin_user_companies

  validates :password, length: { in: 6..64 }, on: :create
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates_confirmation_of :password
end
