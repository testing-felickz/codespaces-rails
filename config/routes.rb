Rails.application.routes.draw do
  root "hello#index"
  get '/my_controller', to: 'my#index'
  get '/my_controller2', to: 'my#index2'
end