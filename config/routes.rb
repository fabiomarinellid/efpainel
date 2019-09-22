Rails.application.routes.draw do
  
  namespace :backoffice do
    namespace :config do
      get 'user/index'
      get 'user/edit'
      get 'user/new'
    end
  end
  namespace :backoffice do
    namespace :product do
      get 'category/index'
    end
  end
  namespace :backoffice do
    namespace :config do
      get 'about/index'
    end
  end
  namespace :backoffice do
    namespace :config do
      resources :title, except: [:show, :destroy]
      get 'site/index'
    end
  end
  
  namespace :lanchonetedotrom do
    get 'home/index'
  end
  namespace :backoffice do
    get 'dashboard/index'
  end
  devise_for :users
  
  

  root 'backoffice/dashboard#index'
  # root 'lanchonetedotrom/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
