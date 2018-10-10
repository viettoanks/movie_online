Rails.application.routes.draw do
  root "static_pages#home"
  get "/home", to: "static_pages#home", as: :home
  get "/help", to: "static_pages#help", as: :help
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }, path: "", path_names: {sign_in: "login", sign_out: "logout",
      sign_up: "signup", edit:"edit-profile"}
  resources :movies, only: :show do
    get "/ep-:order", to: "movies#show", as: :watch
  end
end
