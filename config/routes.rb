Rails.application.routes.draw do
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  root 'events#index'
  resources :events do
    collection do
      get :chart
    end    
  end

end
