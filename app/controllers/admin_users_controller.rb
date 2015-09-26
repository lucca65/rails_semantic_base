class AdminUsersController < ApplicationController
  before_action :find_admin_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin_user!, :set_locale

  def index
    @admin_users = AdminUser.all.order('created_at DESC')
    @admin_users = @admin_users.page(params[:page])
    authorize!(:read, @admin_user)
  end

  def new
    @admin_user = AdminUser.new
    authorize!(:create, @admin_user)
  end

  def create
    @admin_user = AdminUser.new(admin_users_params)

    pepper                         = nil
    cost                           = 10
    password                       = @admin_user.password
    new_encrypted_password         = BCrypt::Password
                                       .create("#{password}#{pepper}", cost: cost).to_s
    @admin_user.encrypted_password = new_encrypted_password

    if @admin_user.save
      handle_transaction_types
      redirect_to(admin_users_path)
    else
      render('new')
    end

  end

  def edit
  end

  def update
    if @admin_user.update(admin_users_params)
      handle_transaction_types

      redirect_to(admin_users_path)
    else
      render('edit')
    end
  end

  def destroy
    @admin_user.destroy
    redirect_to(admin_users_path)
  end

  private

  def handle_transaction_types
    transaction_types_params = params['transaction_types']

    return if transaction_types_params.nil?

    transaction_types_old    = Array.new

    AdminUserTransactionType.where(admin_user_id: @admin_user.id).find_each do |type|
      transaction_types_old.push(type.transaction_type_id.to_s)
    end

    transaction_types_params.each do |transaction_type_id|
      next if transaction_types_old.include?(transaction_type_id)

      unless transaction_types_old.include?(transaction_type_id)
        AdminUserTransactionType.create(admin_user_id: @admin_user.id, transaction_type_id: transaction_type_id)
      end

    end

    transaction_types_old.each do |transaction_type_id|
      unless transaction_types_params.include?(transaction_type_id)
        admin = AdminUserTransactionType
                  .find_by_transaction_type_id_and_admin_user_id(transaction_type_id, @admin_user.id)
        admin.destroy unless nil?
      end
    end

  end



  def find_admin_user
    @admin_user = AdminUser.find(params[:id])
  end

  def admin_users_params
    params.require(:admin_user).permit!
  end
end
