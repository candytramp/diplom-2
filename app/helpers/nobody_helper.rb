module NobodyHelper
  def start_links()
    result = []
    if @current_role_user.is_admin?
      result << {:name => 'Пользователи',
         :controller => :users, :action => :index,
         :icon => 'fa-user'}
      result << {:name => 'Роли',
         :controller => :roles, :action => :index,
         :icon => 'fa-cubes'}
    end
   if @current_role_user.is_secretary?
       result <<{:name => 'Документы',
        :controller => :documents, :action => :index,
        :icon => 'fa-file'}
       result <<{:name => 'Участники',
        :controller => :connections, :action => :index,
        :icon => 'fa-user-secret'}
       result <<{:name => 'Отчетность',
        :controller => :statistics, :action => :index,
        :icon => 'fa-file-pdf-o'}
       result <<{:name => 'Статьи',
        :controller => :articles, :action => :index,
        :icon => 'fa-file'}
       result <<{:name => 'Конференции',
        :controller => :conferences, :action => :index,
        :icon => 'fa-users'}
       result <<{:name => 'Дипломы',
        :controller => :diplomas, :action => :index,
        :icon => 'fa-trophy'}
       result <<{:name => 'Выставки',
        :controller => :exhibitions, :action => :index,
        :icon => 'fa-building-o'}
       result <<{:name => 'Экспонаты',
        :controller => :exhibits, :action => :index,
        :icon => 'fa-diamond'}
       result <<{:name => 'Учебники',
        :controller => :textbooks, :action => :index,
        :icon => 'fa-book'}
       result <<{:name => 'Монографии',
        :controller => :monographs, :action => :index,
        :icon => 'fa-file-text'}
       result <<{:name => 'Доклады',
        :controller => :reports, :action => :index,
        :icon => 'fa-file-o'}
      return result
    end
       result <<{:name => 'Документы',
        :controller => :documents, :action => :index,
        :icon => 'fa-file'}
       result <<{:name => 'Участники',
        :controller => :connections, :action => :index,
        :icon => 'fa-user-secret'}
       result <<{:name => 'Отчетность',
        :controller => :statistics, :action => :index,
        :icon => 'fa-file-pdf-o'}
       result <<{:name => 'Статьи',
        :controller => :articles, :action => :index,
        :icon => 'fa-file'}
       result <<{:name => 'Конференции',
        :controller => :conferences, :action => :index,
        :icon => 'fa-users'}
       result <<{:name => 'Дипломы',
        :controller => :diplomas, :action => :index,
        :icon => 'fa-trophy'}
       result <<{:name => 'НИР',
        :controller => :research_efforts, :action => :index,
        :icon => 'fa-flask'}
       result <<{:name => 'Заявки',
        :controller => :ois_requests, :action => :index,
        :icon => 'fa-file-text-o'}
       result <<{:name => 'Лицензии',
        :controller => :licences, :action => :index,
        :icon => 'fa-certificate'}
       result <<{:name => 'Выставки',
        :controller => :exhibitions, :action => :index,
        :icon => 'fa-building-o'}
       result <<{:name => 'Экспонаты',
        :controller => :exhibits, :action => :index,
        :icon => 'fa-diamond'}
       result <<{:name => 'Учебники',
        :controller => :textbooks, :action => :index,
        :icon => 'fa-book'}
       result <<{:name => 'Монографии',
        :controller => :monographs, :action => :index,
        :icon => 'fa-file-text'}
       result <<{:name => 'Доклады',
        :controller => :reports, :action => :index,
        :icon => 'fa-file-o'}
      result <<{:name => 'Области науки',
       :controller => :fields, :action => :index,
       :icon => 'fa-skyatlas'}
      result <<{:name => 'ГРНТИ',
       :controller => :grntis, :action => :index,
       :icon => 'fa-list-ol'}
      result <<{:name => 'Типы НИР',
       :controller => :nir_types, :action => :index,
       :icon => 'fa-list'}
      result <<{:name => 'Научные школы',
       :controller => :scientific_schools, :action => :index,
       :icon => 'fa-graduation-cap'}
      result <<{:name => 'Источники финансирования',
       :controller => :sources, :action => :index,
       :icon => 'fa-credit-card'}
      result <<{:name => 'Федеральные программы',
       :controller => :state_programs, :action => :index,
       :icon => 'fa-briefcase'}
    result
  end
end
