Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'


  resources :articles do
    collection do
      get :search
    end
    resources :comments
  end

  root to: 'welcome#index'
end
