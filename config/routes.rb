Rails.application.routes.draw do
  root "hello#index"
  get '/my_controller', to: 'my#index'
end