class NobodyController < ApplicationController
  before_filter :check_auth, except: [:access_denied, :logout]
  before_filter :check_app_auth, except: [:access_denied, :logout]
    
  def access_denied
  end

  def logout
#    CASClient::Frameworks::Rails::Filter.logout(self)
  end
  
  def start_page    
  end  
end
