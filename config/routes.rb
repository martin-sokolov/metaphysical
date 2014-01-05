SampleApp::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories
  resources :articles do
    collection do
      get :search
    end
    resources :comments, only:[:create]
  end
  resources :videos
  resources :audios
  resources :programs
  resources :faqs
  resources :manifestos, only: [:index, :edit, :update]
  resources :books

  root to: 'static_pages#home'
  match '/loginfail', to: 'static_pages#loginfail'
  match '/signup',  to: 'users#new'
  match '/logout', to: 'sessions#destroy', via: :delete
  match '/contact', to: 'static_pages#contact', via: [:post]
  match '/rating', to: 'books#rating', via: [:get]
  match '/audiodelete', to: 'audios#destroy', via: :delete
  match '/videodelete', to: 'videos#destroy', via: :delete
  match '/programdelete', to: 'programs#destroy', via: :delete
  match '/bookdelete', to: 'books#destroy', via: :delete
  match '/faqdelete', to: 'faqs#destroy', via: :delete
  match '/categorydelete', to: 'categories#destroy', via: :delete
  match '/articledelete', to: 'articles#destroy', via: :delete
end
