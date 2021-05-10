Rails.application.routes.draw do
  
  root 'events#index'
  resources :events do
    collection do
      get :chart
    end    
  end
  
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
