class ApplicationController < ActionController::Base

 helper_method :signed_in?, :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsConcern


  before_filter :set_locale
  
    # Before filters
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
  
    def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    end
  
end
