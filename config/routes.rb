Purpleline::Application.routes.draw do

  #get "static_pages/page"
  resources :members
  devise_for :users, :path_names => {:sign_up => "register"}
namespace :admin do
	resources :newsletters_translations
	resources :newsletters_types
  resources :newsletters
  resources :events_translations
  resources :events_types
  resources :events
  resources :pages_translations
  resources :pages
  resources :languages
  resources :announces_types  
  resources :announces
  resources :announces_translations
  resources :tasks
  resources :tasks_translations
  resources :stations
  resources :stations_translations  
  resources :progresses
  resources :profiles

end
root :to => "home#present"
  #get "home/index"
  #get "home/mrta"
  #get "home/present"
  #get "home/filterstation"
  match "/page/:filename.:format" => "static_pages#page"
  match "/allstation" => "home#allstation"
  match "/test" => "home#index"
  match "/mrta" => "home#mrta"
  match "/project" => "home#project"
  match "/station/:id" => 'home#station'
  match "/pagetran/:id" => 'home#pagetran'
  match "/pageview/:id" => 'home#pageview'
  match "/mrtaview/:id" => 'home#mrtaview'  
  match "/announce/:id" => 'home#announcement' 
  match "/progress" => 'home#progress'
  match "/filterstation/:id" => 'home#filterstation'
  match "/fullmap" => 'home#fullmap'
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
