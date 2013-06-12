App::Application.routes.draw do
  root 'welcome#index'

  controller :login do
    get 'login',            action: :new
    post 'login',           action: :create
    delete 'logout',        action: :destroy
  end

  resources :sketches,      only: [:show]

  resources :designers do
    resources :storyboards, only: [ :index, :show, :create, :update]
    resources :sketches,    only: [ :index, :show, :create, :update]
  end

  resources :storyboards do
    get 'get-viewers',      on: :member, action: :get_viewers
    put 'set-viewer',       on: :member, action: :set_viewer
    get 'get-participants', on: :member, action: :get_participants
    post 'invite',          on: :member, action: :invite

    resources :designers,   only: [:index, :show, :create]
    resources :sketches,    only: [:index, :show]
  end
end
