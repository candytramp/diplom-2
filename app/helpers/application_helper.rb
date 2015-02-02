module ApplicationHelper
  def generate_side_bar_items()
    result = []
    if @current_role_user.is_admin?
      result << {
        :name => 'Администрирование',
        :icon => 'fa-wrench',
        :children => [
        {:name => 'Пользователи',
         :controller => :users, :action => :index,
         :icon => 'fa-users'},
        {:name => 'Роли',
         :controller => :roles, :action => :index,
         :icon => 'fa-cubes'}
      ]} 
    end
    result.each do |item|
      if item.has_key?(:children)
        item[:children].each do |x| 
          if x[:controller].to_s == controller_name and 
              x[:action].to_s == action_name
            x[:class] = 'side-bar-active'
            item[:class] = 'side-bar-open'
          end
        end
      else  
        if item[:controller].to_s == controller_name and 
            item[:action].to_s == action_name
          item[:class] = 'side-bar-active'
        end
      end
    end
  end

  def generate_top_bar_items()
    result = []
    if @current_role_user.is_admin?
      result << {
        :name => 'Администрирование',
        :children => [
        {:name => 'Пользователи',
         :controller => :users, :action => :index},
        {:name => 'Роли',
         :controller => :roles, :action => :index}
      ]} 
    end
    result   
  end
end
