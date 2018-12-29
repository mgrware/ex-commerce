Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "homes#index"

  resources :charts do
    collection do
      post :add
    end
  end

  resources :checkouts,  except: [:show] do
    collection do
      get :success
    end
  end
end
