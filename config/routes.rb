Rails.application.routes.draw do
  get '/', to: 'formularios#index'
  get '/lista', to: 'formularios#lista'
  resources :platillos
  resources :formularios
  resources :empleados
end
