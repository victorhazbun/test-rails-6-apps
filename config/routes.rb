Rails.application.routes.draw do
  resources :invitations, only: [] do
    get 'accept', on: :collection
  end
  root 'pages#app'
end
