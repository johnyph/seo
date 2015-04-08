Rails.application.routes.draw do
  
  resources :reports, only: [:index, :show]

  devise_for :users
  root 'pages#dashboard'

  post "/upload" => "pages#upload", :as => :upload_csv

  get "/queries" => "queries#index", :as => :queries
  get "/queries/in-url" => "queries#inUrl", :as => :in_url
  get "/queries/link-info.:id" => "queries#linkInfo", :as => :link_info
end
