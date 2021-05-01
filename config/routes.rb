Rails.application.routes.draw do
  root 'events#index'
  resources :events do
    collection do
      get :chart
    end    
  end  
end
