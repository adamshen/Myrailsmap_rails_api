Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    get 'check_cards/search', to: 'check_cards#search'
    resources :check_records do
      collection do
        get 'count'
      end
    end
  end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
