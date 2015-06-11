Rails.application.routes.draw do
  get 'nobody/access_denied'
  get 'nobody/start_page'
  get 'nobody/logout'

  resources :role_users do
    collection do
      post :add_role_line 
    end
  end

  resources :users

  resources :roles

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'nobody#start_page'



  resources :conference_people

  resources :theses

  resources :author_requests

  resources :author_monographs

  resources :people_reports

  resources :people_textbooks

  resources :people_research_efforts

  resources :licence_people

  resources :exhibit_people

  resources :exhibition_people

  resources :diploma_people

  resources :textbooks

  resources :monographs

  resources :diplomas

  resources :exhibits

  resources :exhibitions

  resources :article_authors

  resources :reports

  resources :conferences

  resources :licences

  resources :ois_requests

  resources :documents do
    member do
      get :show_page
      get :show_prev
      get :next_page
      get :prev_page
    end
  end

  resources :research_efforts

  resources :scientific_schools

  resources :state_programs

  resources :nir_types

  resources :sources

  resources :fields

  resources :grntis

  resources :articles 

  resources :people

  resources :charts, only: [:show]
  resources :statistics, only: [:show]
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
