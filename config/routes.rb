Rails.application.routes.draw do
<<<<<<< HEAD
  root 'main#index'

  get 'articles', to: 'articles#index'
  get 'articles/:slug', to: 'articles#show', as: 'article'

  get 'contact', to: 'contacts#new'
  post 'contact', to: 'contacts#create'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
=======
  get "contacts/new"
  get "contacts/create"
  get "home/index"
  root 'home#index'  # The home page
  resources :articles
  resources :contacts, only: [:new, :create]

end
>>>>>>> 20b2a5b (Add contact page)
