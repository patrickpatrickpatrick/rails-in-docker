Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :item_references
  end

  resources :articles do
    resources :item_references
  end
  
  root to: 'articles#index'
end
