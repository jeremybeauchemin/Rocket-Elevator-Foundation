Rails.application.routes.draw do
  post 'twilio/sms'
  get 'leads/new'
  get 'leads/lead'
  

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  #authenticate :user, -> (user) {user.admin?} do
    #authenticate :user, lambda { |u| u.admin? } do
    #mount Blazer::Engine => '/blazer', as: 'blazer'
    #mount Blazer::Engine, at: 'blazer'
    #authenticate :user, ->(user) { user.admin? } do 
  #end
  
  #mount Blazer::Engine, at: "blazer"
  
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end

  
  get 'pages/index'
  get 'pages/residential'
  get 'pages/commercial'
  
   
  get 'blazer' => 'blazer/queries#home'

  post '/new_quote' => 'quotes#new_quote'
  post '/new_lead' => 'leads#new_lead'
  get '/audio_info' => 'pages#welcome'

  get '/interventions/building_by_customer/:id' => 'interventions#building_by_customer'
  get '/interventions/battery_by_building/:id' => 'interventions#battery_by_building'
  get '/interventions/column_by_battery/:id' => 'interventions#column_by_battery'
  get '/interventions/elevator_by_column/:id' => 'interventions#elevator_by_column'
  

  resource :quotes
  resource :employees
  resource :lead
  resources :interventions
 
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end