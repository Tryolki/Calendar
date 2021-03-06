Rails.application.routes.draw do

  get 'hash_tag_pages/show'
  #Плохое решение!
  resources :comments do
    resources :comment_of_comments
  end
  #
  resource :socnets
resources :image_dates do
  member {post :comment_vote}
  member {post :vote,:comment_vote}

  resources :comments
end

resource :user_profile, only: [:show] do
  resource :calendar, only: :show
  resources :hash_tag_pages, only: :show
end


resources :profiles, only: [:index, :show] do
  collection do
    get :search
  end
  resource :user_gallerys, only: :show, on: :member
  resource :calendar, only: :show, on: :member
end


devise_for :users, controllers: {registrations: 'registrations'}
devise_scope :user do
  authenticated :user do
    root :to => 'profiles#index'
  end
  unauthenticated :user do
    root :to => 'devise/sessions#new', as: :unauthenticated_root
  end
end


end
