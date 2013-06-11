App::Application.routes.draw do
  resources :sketches,      only: [:show]

  resources :designers do
    resources :storyboards, only: [ :index, :show, :create, :update]
    resources :sketches,    only: [ :index, :show, :create, :update]
  end

  resources :storyboards do
    post 'invite',          on: :member
    put 'set-viewer',       on: :member, action: :set_viewer
    get 'get-viewers',      on: :member, action: :get_viewers

    resources :designers,   only: [:index, :show, :create]
    resources :sketches,    only: [:index, :show]
  end

  root 'welcome#index'
end
