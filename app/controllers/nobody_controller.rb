class NobodyController < ApplicationController
  def access_denied
  end

  def logout
#    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end
