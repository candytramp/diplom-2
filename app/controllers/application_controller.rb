class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :check_auth
  before_filter :check_app_auth

  def check_auth()
#    unless request.format.js?
#      CASClient::Frameworks::Rails::Filter.filter(self)
#    end
  end

  def check_app_auth()
    session[:case_user] = 'radigin' # Заглушка на время отсутствия CAS
    if session[:cas_user].nil?
#      redirect_to(:controller => :roles, :action => :access_denied,
#        :bad_action_name => action_name,
#        :bad_controller_name => controller_name)
    
    else
      @current_user = session[:cas_user]      
      unless check_ctr_auth()
#      redirect_to(:controller => :roles, :action => :access_denied,
#        :bad_action_name => action_name,
#        :bad_controller_name => controller_name)
      end
    end
  end

  def logout
#    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  private
  def check_ctr_auth()
    return true
  end
end
