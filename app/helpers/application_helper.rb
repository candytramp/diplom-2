module ApplicationHelper
  def generate_side_bar_items()
    result = []
    return result if @current_role_user.nil?
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
              x[:action].to_s == menu_action(action_name, controller_name)
            x[:class] = 'side-bar-active'
            item[:class] = 'side-bar-open'
          end
        end
      else  
        if item[:controller].to_s == controller_name and 
            item[:action].to_s == menu_action(action_name, controller_name)
          item[:class] = 'side-bar-active'
        end
      end
    end
  end

  def menu_action(real_action, real_controller)
    case real_action
    when 'edit', 'new', 'create', 'update', 'destroy', 'show'
      'index'
    else
      real_action
    end
  end
  
  def generate_top_bar_items()
    result = []
    return result if @current_role_user.nil?
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

  def error_messages_for(object)
    render 'error_messages_for', object: object
  end

  def error_messages_for_attr(object, attr)
    render 'error_messages_for_attr', object: object, attr: attr
  end
end
