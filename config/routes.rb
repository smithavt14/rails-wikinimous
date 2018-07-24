Rails.application.routes.draw do

  root to: 'articles#home'
  resources :articles
end
