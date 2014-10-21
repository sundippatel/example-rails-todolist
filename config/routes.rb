Rails.application.routes.draw do
  resources :categories

  resources :abcs

  resources :todos
  root to: 'todos#index'
end
