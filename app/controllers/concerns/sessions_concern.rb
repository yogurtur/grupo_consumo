module SessionsConcern
  extend ActiveSupport::Concern

  def sign_in(user)
    #remember_token = User.new_remember_token
    #cookies.permanent[:remember_token] = remember_token
    #user.update_attribute(:remember_token, User.hash(remember_token))
    #self.current_user = user
    session[:current_user_id] = user.id
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    #remember_token = User.hash(cookies[:remember_token])
    #@current_user ||= User.find_by(remember_token: remember_token)
      @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
  
  def sign_out
    #current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    #cookies.delete(:remember_token)
    #self.current_user = nil
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end
  
  def not_need_authenticate
  if current_user
  redirect_to root_url, notice: 'You are already logged'
  end
  end
  
end
