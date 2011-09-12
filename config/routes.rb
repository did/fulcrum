Fulcrum::Application.routes.draw do

  get 'story/new'

  resources :projects do
    resources :users, :only => [:index, :create, :destroy]
    resources :changesets, :only => [:index]
    resources :stories, :only => [:index, :create, :update, :destroy, :show] do
      collection do
        get :done
        get :in_progress
        get :backlog
        get :import
        post :import_upload
      end
      member do
        put :start
        put :finish
        put :deliver
        put :accept
        put :reject
      end
    end
  end

  namespace :public_view do
    root :to => 'projects#index'

    resources :projects do
      resources :changesets, :only => [:index]
      resources :stories, :only => [:index, :show] do
        collection do
          get :done
          get :in_progress
          get :backlog
        end
      end
    end
  end

  devise_for :users, :controllers => { :confirmations => "confirmations" }


  root :to => "public_view/projects#index"
end
