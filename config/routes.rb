Purpleline::Application.routes.draw do


  resources :reports

  #get "static_maps/map"

  #get "static_pages/page"
  resources :members
  devise_for :users, :path_names => {:sign_up => "register"}
namespace :admin do
  resources :purple_assets
  resources :profiles
  resources :roles
  resources :newsletters_translations
  resources :categories
  resources :newsletters_types
  resources :newsletters  do resources :purple_assets end
  resources :events_translations
  resources :events_types
  resources :events do resources :purple_assets end
  resources :pages_translations
  resources :pages
  resources :languages
  resources :announces_types  
  resources :announces do resources :purple_assets end
  resources :announces_translations
  resources :tasks
  resources :tasks_translations
  resources :stations do resources :purple_assets end
  resources :stations_translations  
  resources :progresses
  resources :users
  resources :reports
  resources :reports_translations
  resources :reports_types
end
  #root :to => "home#present"
  root :to => "home#index",:lang=>"th"
  #get "home/index"
  #get "home/mrta"
  #get "home/present"
  #get "home/filterstation"
  get   "/home/allannounce"
  get   "home/lasttenannounce"
  get   "home/monthlyannounce"
  get   "/home/allnews"
  get   "/home/lasttennews"
  get   "/home/monthlynews"
  get   "home/setlang"
  #match "/googlehostedservice.html"
  match "/page/:filename.:format" => "static_pages#page"
  match "/map/:mapname/:filename.:format" => "static_maps#map"
  match "/map/:mapname/:z/:x/:y.:format" => "static_maps#maptile"
  match "/allstation" => "home#allstation"
  match "/main" => "home#index"
  match "/mrta" => "home#mrta"
  match "/allannounce" =>  "home#allannounce"
  match "/project" => "home#project"
  match "/station/:id" => 'home#station'
  match "/faceboxmap/:id" => 'home#faceboxmap'
  match "/pagetran/:id" => 'home#pagetran'
  match "/pageview/:id" => 'home#pageview'
  match "/mrtaview/:id" => 'home#mrtaview' 
  match "/category/:id" => 'home#category'   
  match "/announce/:id" => 'home#announcement' 
  match "/showevent/:id" => 'home#showevent'   
  match "/showreport/:id" => 'home#showreport'   
  match "/shownews/:id" => 'home#shownews'   
  match "/progress" => 'home#progress'
  match "/filterstation/:id" => 'home#filterstation'
  match "/fullmap" => 'home#fullmap'
  match "/admin" => 'admin/pages#index'
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
