Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      # We are going to list our API resources here
      resources :urls, :only => [:create, :update, :destroy, :index, :show]
    end
  end
  get ':short_url', to: 'urls#go', as: 'go_router'
end
