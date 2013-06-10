App::Application.routes.draw do

  resources :sketches,      only: [:show]

  resources :designers do
    resources :storyboards, only: [ :index, :show, :create, :update]
    resources :sketches,    only: [ :index, :show, :create, :update]
  end

  resources :storyboards do
    post 'invite',          on: :member
    get 'get_viewers',      on: :member
    put 'set_viewer',       on: :member
    
    resources :designers,   only: [:index, :show, :create]
    resources :sketches,    only: [:index, :show]
  end

  root 'welcome#index'

end
