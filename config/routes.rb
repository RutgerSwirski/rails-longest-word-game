Rails.application.routes.draw do
  post 'score', to: 'games#score', as: :score
  root to: 'games#new', as: :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
