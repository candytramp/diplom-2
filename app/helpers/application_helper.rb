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
         :icon => 'fa-cubes'},
       {:name => 'Персоналии',
         :controller => :people, :action => :index,
         :icon => 'fa-male'}
      ]} 
    end
    if @current_role_user.is_secretary?
       result << {
       :name => 'Редактирование',
       :icon => 'fa-pencil',
       :children => [
       {:name => 'Статьи',
        :controller => :articles, :action => :index,
        :icon => 'fa-file'},
       {:name => 'Конференции',
        :controller => :conferences, :action => :index,
        :icon => 'fa-file'},
       {:name => 'Дипломы',
        :controller => :diplomas, :action => :index,
        :icon => 'fa-file'},
      {:name => 'Выставки',
        :controller => :exhibitions, :action => :index,
        :icon => 'fa-file'},
       {:name => 'Экспонаты',
        :controller => :exhibits, :action => :index,
        :icon => 'fa-file'},
       {:name => 'Учебники',
        :controller => :textbooks, :action => :index,
        :icon => 'fa-file'},
       {:name => 'Монографии',
        :controller => :monographs, :action => :index,
        :icon => 'fa-file'},
       {:name => 'Доклады',
        :controller => :reports, :action => :index,
        :icon => 'fa-file'}
       ]}
      
    else
      result << {
        :name => 'Словари',
        :icon => 'fa-book',
        :children => [
        {:name => 'Области науки',
         :controller => :fields, :action => :index,
         :icon => 'fa-tag'},
        {:name => 'ГРНТИ',
         :controller => :grntis, :action => :index,
         :icon => 'fa-tag'},
        {:name => 'Типы НИР',
         :controller => :nir_types, :action => :index,
         :icon => 'fa-tag'},
        {:name => 'Научные школы',
         :controller => :scientific_schools, :action => :index,
         :icon => 'fa-tag'},
        {:name => 'Источники финансирования',
         :controller => :sources, :action => :index,
         :icon => 'fa-tag'},
        {:name => 'Федеральные программы',
         :controller => :state_programs, :action => :index,
         :icon => 'fa-tag'}
        ]}
       result << {
         :name => 'Редактирование',
         :icon => 'fa-pencil',
         :children => [
         {:name => 'Статьи',
          :controller => :articles, :action => :index,
          :icon => 'fa-file'},
         {:name => 'Конференции',
          :controller => :conferences, :action => :index,
          :icon => 'fa-file'},
         {:name => 'Дипломы',
          :controller => :diplomas, :action => :index,
          :icon => 'fa-file'},
         {:name => 'НИР',
          :controller => :research_efforts, :action => :index,
          :icon => 'fa-file'},
         {:name => 'Заявки',
          :controller => :ois_requests, :action => :index,
          :icon => 'fa-file'},
         {:name => 'Лицензии',
          :controller => :licences, :action => :index,
          :icon => 'fa-file'},
         {:name => 'Выставки',
          :controller => :exhibitions, :action => :index,
          :icon => 'fa-file'},
         {:name => 'Экспонаты',
          :controller => :exhibits, :action => :index,
          :icon => 'fa-file'},
         {:name => 'Учебники',
          :controller => :textbooks, :action => :index,
          :icon => 'fa-file'},
         {:name => 'Монографии',
          :controller => :monographs, :action => :index,
          :icon => 'fa-file'},
         {:name => 'Доклады',
          :controller => :reports, :action => :index,
          :icon => 'fa-file'}
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
=begin    return result if @current_role_user.nil?
    result << {
      :name => 'Словари',
      :children => [
      {:name => 'Области науки',
       :controller => :fields, :action => :index},
      {:name => 'ГРНТИ',
       :controller => :grntis, :action => :index},
      {:name => 'Типы НИР',
       :controller => :nir_types, :action => :index},
      {:name => 'Научные школы',
       :controller => :scientific_schools, :action => :index},
      {:name => 'Источники финансирования',
       :controller => :sources, :action => :index},
      {:name => 'Федеральные программы',
       :controller => :state_programs, :action => :index}
      ]}


    if @current_role_user.is_admin?
      result << {
        :name => 'Администрирование',
        :children => [
        {:name => 'Пользователи',
         :controller => :users, :action => :index},
        {:name => 'Роли',
         :controller => :roles, :action => :index},
        {:name => 'Персоналии',
         :controller => :people, :action => :index}
      ]} 
    end
=end
    result   
  end

  def error_messages_for(object)
    render 'error_messages_for', object: object
  end

  def error_messages_for_attr(object, attr)
    render 'error_messages_for_attr', object: object, attr: attr
  end
end
