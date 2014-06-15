MusicDuel::Application.routes.draw do
  resources :duels do 
    resources :votes, only: [:create, :update]
    get :autocomplete_artist_name, on: :collection
  end

  resources :artists do#, only: [:index, :show, :create, :update]
    get :autocomplete_tag_name, on: :collection 
  end
 
  get 'tags/:tag', to: 'artists#index', as: :tag 

  match '/auth/:provider/callback' => 'sessions#create', via: %i(get post)
  match '/logout'                  => 'sessions#destroy', via: %i(get delete), as: :logout
  match '/login'                   => 'sessions#new', via: %i(get), as: :login

  concern :the_role, TheRole::AdminRoutes.new

  namespace :admin do
    concerns :the_role
  end
end
