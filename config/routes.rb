Rails.application.routes.draw do
  post   'rest/login', to: 'users#login'
  get    'users',      to: 'users#index'
  post   'users',      to: 'users#create'
  get    'users/:id',  to: 'users#show'
  patch  'users/:id',  to: 'users#update'
  put    'users/:id',  to: 'users#update'
  delete 'users/:id',  to: 'users#destroy'
end
