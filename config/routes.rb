Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :profiles, param: :username

    resources :movie_watchlists do
      get :show_entry, on: :collection
      #patch :update, params: [:id, :status, :score], on: :collection
    end
    get "/movie_watchlists/:username", to: "movie_watchlists#show"

    resources :watchlist_series do
      get :show_entry, on: :collection
    end
    get "/watchlist_series/:username", to: "watchlist_series#show"

    resources :movie_scores

    resources :series_scores

    resources :posts do
      get :index_media, on: :collection
      get :index_category, on: :collection
    end

    resources :comments

    resources :reviews do
      get :index_media, on: :collection
      get :index_user, on: :collection
    end

    resources :likes do
      get :show_user, on: :collection
    end

    devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }
    devise_scope :user do
      get 'users/current', to: 'sessions#show'
    end
    resources :users, :only => [:show, :index]
  end

  root to: 'home#index'
end
