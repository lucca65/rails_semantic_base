class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_filter :authenticate_admin_user!, :set_locale
  layout :layout_by_resource
  before_action :define_current_ability
  skip_before_action :verify_authenticity_token, only: [:set_company]

  def set_company
    session[:company] = params[:id]
    render nothing: true
  end

  def current_user
    authenticate_admin_user!
  end

  private

  def set_locale
    params[:locale] = params[:locale] || I18n.default_locale
    I18n.locale = params[:locale]
  end

  def layout_by_resource
    devise_controller? ? 'login' : 'application'
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end
  def define_current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end
  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403.html", status: 403, layout: false
  end

  def after_sign_in_path_for(resource_or_scope)
    unless current_admin_user.companies == []
      session[:company] = current_admin_user.companies.first.id
    end
    root_path
  end
end
