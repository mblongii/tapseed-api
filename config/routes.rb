App::Application.routes.draw do
  root 'welcome#index'
  resources :storyboards do
    member do
      get 'get_viewers'
      put 'set_viewer'
    end
  end
  resources :sketches, except: [:new, :edit]
  resources :designers, except: [:new, :edit]
end
