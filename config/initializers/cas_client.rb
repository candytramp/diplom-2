#CAS авторизация

CASSERVER                            = 'https://svc.msiu.ru/'

require 'casclient'
require 'casclient/frameworks/rails/filter'

CASClient::Frameworks::Rails::Filter.configure(
   :cas_base_url => CASSERVER)
