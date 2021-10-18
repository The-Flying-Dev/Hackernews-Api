Rails.application.routes.draw do
  root to: 'stories#top'
  get 'stories/:id', to:'stories#show', as: :story
  get 'comments/:id', to: 'comments#show', as: :comment
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
