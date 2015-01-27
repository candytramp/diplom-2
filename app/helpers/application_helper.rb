module ApplicationHelper
  def generate_side_bar_items()
    result = {}
    if @current_role_user.is_admin?
      result[:children] = [
        {:name => 'Пользователи',
         :controller => :users, :action => :index,
         :icon => 'fa-users'},
        {:name => 'Роли',
         :controller => :roles, :action => :index,
         :icon => 'fa-cubes'}
      ] 
    end
  end
end
