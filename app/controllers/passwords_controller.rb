class PasswordsController < ApplicationController

  before_filter :authenticate_admin_user!, :set_locale

  def edit
    @admin_user = current_admin_user
    render layout: 'login'
  end

  def update
    @admin_user = AdminUser.find(current_admin_user.id)
    if @admin_user.update(password_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @admin_user, :bypass => true
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def password_params
    params.required(:admin_user).permit(:password, :password_confirmation)
  end
end