require "constraints/subdomain_required"
Rails.application.routes.draw do
  # constraints urls to account subdomain only
  constraints(SubdomainRequired) do
    scope module: "accounts" do
      root to: "home#index", as: :account_root
      resources :users, path: 'invite', only: [:index, :new, :create]
      resources :lectures, only: [:index, :show] do
        resources :registrations, path: 'enrollment', only: [:new, :create, :destroy]
      end

      resources :forums do
        resources :comments
      end

      resources :schedules, only: [:index] do
        resources :bookings, only: [:new, :create]
      end

      resources :bookings, except: [:index, :show] do
        get :personal, on: :collection
      end

      resources :questions, except: [:index] do
        get :personal, on: :collection
      end

      get 'lessons/enrolled' => 'registrations#enrolled', as: :enrolled




      resources :invitations, except: [:index, :show, :new, :create, :edit, :update, :destroy] do
        member do
          get 'accept' => "invitations#accept"
          patch 'accepted' => "invitations#accepted"
        end
      end

      namespace :admin do
        root 'application#index'
        resources :invitations, only: [:new, :create]
        resources :users, except: [:show]
        resources :lectures, path: "lessons", except: [:index, :show]
        resources :bookings, only: [:index, :show]
        resources :questions, only: [:index, :show]
        resources :schedules
      end

      namespace :settings do
        root 'accounts#show'
        resources :accounts, only: [:show, :edit, :update]
      end
    end
  end

  # devise_for :users
  devise_for :users, path: 'users', controllers: { registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}
  resources :accounts, only: [:new, :create]

  get 'detail' => 'welcome#detail', as: :landing
  get 'about' => 'welcome#about', as: :about
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
