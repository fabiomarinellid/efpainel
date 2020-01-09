Rails.application.routes.draw do
  
  namespace :backoffice do
    namespace :product do
      resources :observation, except: [:show]
      match 'observation/:id' => 'observation#destroy', via: [:get]
    end
  end
  namespace :backoffice do
    namespace :product do
      resources :item, except: [:show]
      match 'item/:id' => 'item#destroy', via: [:get]
    end
  end
  namespace :backoffice do
    namespace :product do
      resources :product, except: [:show]
      match 'product/:id' => 'product#destroy', via: [:get]
    end
  end
  namespace :backoffice do
    namespace :product do
      resources :label, except: [:show]
      match 'label/:id' => 'label#destroy', via: [:get]
    end
  end
  namespace :backoffice do
    namespace :contact do
      resources :phone, except: [:show]
      match 'phone/:id' => 'phone#destroy', via: [:get]
    end
  end
  namespace :backoffice do
    namespace :contact do
      resources :address, except: [:show]
      match 'address/:id' => 'address#destroy', via: [:get]
    end
  end
  namespace :backoffice do
    namespace :config do
      resources :user, except: [:show]
      match 'user/:id' => 'user#destroy', via: [:get]
    end
  end
  namespace :backoffice do
    namespace :product do
      resources :category, except: [:show]
      match 'category/:id' => 'category#destroy', via: [:get]
    end
  end
  namespace :backoffice do
    namespace :config do
      resources :about, except: [:show]
      match 'about/:id' => 'about#destroy', via: [:get]
    end
  end
  namespace :backoffice do
    namespace :config do
      resources :title, except: [:show, :destroy]
      match 'title/:id' => 'title#destroy', via: [:get]
    end
  end
  namespace :backoffice do
    namespace :config do
      resources :site, except: [:show, :destroy]
      match 'site/:id' => 'site#destroy', via: [:get]
    end
  end
  
  namespace :lanchonetedotrom do
    get 'home/index'
  end
  namespace :backoffice do
    get 'dashboard/index'
  end
  devise_for :users
  
  

  get 'lanchonete', to: 'lanchonetedotrom/home#index'
  root 'backoffice/dashboard#index'
  # root 'lanchonetedotrom/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
