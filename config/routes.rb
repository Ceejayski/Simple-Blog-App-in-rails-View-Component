Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users

  resources :groups, only: %i[new create show destroy edit update] do
    resources :members, only: %i[create], module: 'groups' do
      delete :destroy, on: :collection
    end
    resources :posts, module: 'groups'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'articles#index'
end
