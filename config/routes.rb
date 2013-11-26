Commentsapp::Application.routes.draw do
  


  resources :stocks


  match '/about',    to: 'static_pages#about'
  match '/contact',    to: 'static_pages#contact'
  match '/faq',    to: 'static_pages#faq'
  match '/signup', to: 'static_pages#signup'

  get "static_pages/home"

  # get "static_pages/about"

  # get "static_pages/contact"

  # get "static_pages/faq"

  get "users/index"

  get "users/show"

  get "users/new"

  get "users/edit"


match "portfolios" => 'portfolios#index', :defaults => { :id => 1 }

  authenticated :user do
   root :to => 'users#show'
  end

  root :to => "static_pages#home"

  # namespace :users do
  #  root to: "static_pages#faq"
  # end

  # root to: "static_pages#home"

  devise_for :users, :path => 'accounts' do
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  end



  # match 'users/:id/portfolios' => 'portfolios#index', :as => :purchase

   # resources :remarks

  resources :users, path: '' do
    resources :portfolios
  end 


  scope ':user_id' do
    resources :portfolios
  end
  # scope module: 'admin' do
  #   resources :portfolios
  # end  

  resources :trades do
    resources :remarks
  end  



  resources :portfolios do
    resources :trades
       # resources :remarks
  end  

  resources :comments

  

  

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
