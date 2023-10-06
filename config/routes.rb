Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'generate_test_users/', to: 'generate_test_users#generate_test_users'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
