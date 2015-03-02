module MenusHelper

  def menu(user = nil)
    menu_items = {}

    unless user.nil?
      menu_items.merge!({
        'Редактирование' => {
          'Учебники' => {:controller => :textbooks, :action => :index},
          'Монографии' => {:controller => :monographs, :action => :index}
        },
        'Очёт' => {:controller => :people, :action => :index}
      })
        
      role = user.current_role.role
      if role
        case role.name
        when 'Admin' then
          menu_items.merge!({
            'Персоналии' => {:controller => :people, :action => :index},
            'Управление доступом' => {
              'Пользователи' => {:controller => :users, :action => :index},
              'Назначение ролей' => {:controller => :role_users, :action => :index},
              'Режимы доступа' => {:controller => :roles, :action => :index},
            }
          })
        end
      end
      
    end
    
    menu_items
  end
end
