Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :articles do
      resources :item_references
    end
    resources :events
  end

  root to: 'admin/articles#index'
end
