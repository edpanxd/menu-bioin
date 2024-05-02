Rails.application.routes.draw do
  get '/', to: 'formularios#index'
  get '/lista', to: 'formularios#lista'
  post '/encuesta', to: 'formularios#create'
  resources :platillos
  resources :formularios
  resources :empleados
end
