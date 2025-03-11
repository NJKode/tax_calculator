Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  get "index/index"
  get "index/calculate", to: "index#calculate"

  root   'index#index'
end
