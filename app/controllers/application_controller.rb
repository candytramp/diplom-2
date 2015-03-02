class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :check_auth
  before_filter :check_app_auth

  def check_auth()
    unless request.format.js?
      CASClient::Frameworks::Rails::Filter.filter(self)
    end
  end

  def check_app_auth()
   # session[:cas_user] = 'radigin'  Заглушка на время отсутствия CAS
    if session[:cas_user].nil?
      redirect_to(:controller => :nobody, :action => :access_denied,
        :bad_action_name => action_name,
        :bad_controller_name => controller_name)
    else
      @current_user = session[:cas_user]
      @current_user_object = User.where(
        :login => @current_user).includes(:role_users => :role).first
      
      unless @current_user_object.nil?
        @current_role_user = params[:current_role_id]
        @current_role_user = session[:current_role_id] if @current_role_user.nil?
        if @current_role_user.nil?
          @current_role_user = @current_user_object.role_users.first
        else
          @current_role_user = RoleUser.find(@current_role_user)
          unless @current_user_object.role_users.include?(@current_role_user)
            @current_role_user = @current_user_object.role_users.first
          end
        end
        unless @current_role_user.nil?
          session[:current_role_id] = @current_role_user.id
        end  
        unless check_ctr_auth()
          redirect_to(:controller => :nobody, :action => :access_denied,
            :bad_action_name => action_name,
            :bad_controller_name => controller_name,
            :bad_user_name => @current_user)
        end
      else
        redirect_to(:controller => :nobody, :action => :access_denied,
          :bad_action_name => action_name,
          :bad_controller_name => controller_name,
          :bad_user_name => @current_user)
      end  
    end
  end

  private
  def check_ctr_auth()
    return true
  end
end
