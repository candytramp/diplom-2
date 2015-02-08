class NobodyController < ApplicationController
  def access_denied
  end

  def logout
#    CASClient::Frameworks::Rails::Filter.logout(self)
  end
  
  def start_page
    
  end
  
  private
  def check_ctr_auth()
    return false if action_name == 'start_page' and @current_user_object.nil?
    return true
  end  
end
