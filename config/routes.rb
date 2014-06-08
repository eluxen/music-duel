MusicDuel::Application.routes.draw do
  resources :duels do 
    resources :votes, only: [:create, :update]
    get :autocomplete_artist_name, on: :collection
  end

  resources :artists do#, only: [:index, :show, :create, :update]
    get :autocomplete_tag_name, on: :collection 
  end
  get 'tags/:tag', to: 'artists#index', as: :tag 
end
