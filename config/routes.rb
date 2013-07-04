Docnet::Application.routes.draw do


  scope "(:locale)", :locale => /en|es/ do


  match 'appointments/new_appointment_doctor_search' => 'appointments#new_appointment_doctor_search'
  match 'appointments/new_appointment_calendar' => 'appointments#new_appointment_calendar'
  match 'appointments/doctor_appointments' => 'appointments#doctor_appointments'
  match 'appointments/patient_appointments' => 'appointments#patient_appointments'


  resources :patients


  resources :doctors


  resources :medical_specifications


  resources :appointments


  resources :hospitals


  resources :addresses


  resources :cities


  resources :states


  resources :countries


  resources :prepaid_medicals


  devise_for :users, :controllers => { :registrations => "registrations"}

  resources :users


  resources :user_roles

  end

  match '/:locale' => "dashboard#index"



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


  root :to => 'dashboard#index'

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
