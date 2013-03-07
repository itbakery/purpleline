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

  root :to => "home#index",:lang=>"th"
  get   "/home/allannounce"
  get   "home/lasttenannounce"
  get   "home/monthlyannounce"
  get   "/home/allnews"
  get   "/home/lasttennews"
  get   "/home/monthlynews"
  get   "/home/allreport"
  get   "home/latestreport"
  get   "home/monthlyreport"
  get   "/home/allevent"
  get   "home/latestevent"
  get   "home/monthlyevent"
  get   "home/gallery"   
  get   "home/setlang"
  match "/page/:filename.:format" => "static_pages#page"
  match "/map/:mapname/:filename.:format" => "static_maps#map"
  match "/map/:mapname/:z/:x/:y.:format" => "static_maps#maptile"
  match "/allstation" => "home#allstation"
  match "/main" => "home#index"
  match "/mrta" => "home#mrta"
  match "/gallery" => "home#gallery"
  match "/allannounce" =>  "home#allannounce"
  match "/project" => "home#project"
  match "/station/:id" => 'home#station'
  match "/faceboxmap/:id" => 'home#faceboxmap'
  match "/pagetran/:id" => 'home#pagetran'
  match "/pageview/:id" => 'home#pageview'
  match "/mrtaview/:id" => 'home#mrtaview' 
  match "/category/:id" => 'home#category'   
  match "/eventstype/:id" => 'home#eventstype'   
  match "/reportstype/:id" => 'home#reportstype'   
  
  match "/announce/:id" => 'home#announcement' 
  match "/showevent/:id" => 'home#showevent'   
  match "/showreport/:id" => 'home#showreport'   
  match "/shownews/:id" => 'home#shownews'   
  match "/progress" => 'home#progress'
  match "/filterstation/:id" => 'home#filterstation'
  match "/fullmap" => 'home#fullmap'
  match "/admin" => 'admin/pages#index'

end
