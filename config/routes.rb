Rails.application.routes.draw do
resources :patients
resources :physicians do
  resources :appointments
end
end
