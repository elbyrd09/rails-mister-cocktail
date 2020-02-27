Rails.application.routes.draw do
  get 'doses/index'
  get 'doses/new'
  get 'doses/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'cocktails#home'
resources :cocktails, only: [:index, :show, :new, :create]
  resources :doses, only: [:index, :new, :create]
end

# A user can see the list of cocktails
# GET "cocktails"
# A user can see the details of a given cocktail, with the dose needed for each ingredient
# GET "cocktails/42"
# A user can create a new cocktail
# GET "cocktails/new"
# POST "cocktails"


