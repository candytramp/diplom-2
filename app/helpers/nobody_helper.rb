module NobodyHelper
  def start_links()
    result = []
    if @current_role_user.is_admin?
      result << {:name => 'Пользователи',
         :controller => :users, :action => :index,
         :icon => 'fa-users'}
      result << {:name => 'Роли',
         :controller => :roles, :action => :index,
         :icon => 'fa-cubes'}
    end
    result
  end
end
