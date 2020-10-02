class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    
    def configure_permitted_parameters
        added_attrs = [:username, :email, :password, :password_confirmation,:gender,:birth, :remember_me,:edit]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
    
    def destroy
        sign_out
        redirect_to root_url
    end
end 

    protected
    def configure_permitted_parameters
        permit_parameters_for_sign_up = [:name, :email,:password, :password_confirmation, :birth, :gender]
        permit_parameters_for_update = [:name,:password, :password_confirmation, :birth, :gender]
        devise_parameter_sanitizer.permit :sign_up, keys: permit_parameters_for_sign_up
        devise_parameter_sanitizer.permit :account_update, keys: permit_parameters_for_update
    end
    include ApplicationHelper
end
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
      permit_parameters_for_sign_up = [:name, :email,:password, :password_confirmation, :birth, :gender]
      permit_parameters_for_update = [:name,:password, :password_confirmation, :birth, :gender]
      devise_parameter_sanitizer.permit :sign_up, keys: permit_parameters_for_sign_up
      devise_parameter_sanitizer.permit :account_update, keys: permit_parameters_for_update
  end
  def set_locale
      locale = params[:locale].to_s.strip.to_sym
      I18n.locale = I18n.available_locales.include?(locale) ?
        locale : I18n.default_locale
  end
  include ApplicationHelper
end
