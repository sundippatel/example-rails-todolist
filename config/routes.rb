Rails.application.routes.draw do
  resources :abcs

  resources :todos
  root to: 'todos#index'
end
