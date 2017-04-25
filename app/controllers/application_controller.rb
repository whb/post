class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # check_authorization
  
  before_action :set_locale
   
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end


  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  private

  def current_user
    @current_user ||= User.obtain(session[:user_id]) if session[:user_id]
  end

  def current_organization
    @current_organization ||= current_user.organization if current_user
    @current_organization == nil ? Organization.nil_object : @current_organization
  end

  helper_method :current_user, :current_organization
end
