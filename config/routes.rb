EcoBuddy::Application.routes.draw do

  scope :api do
    resources :articles, default: { format: :json }, except: [ :new, :edit] do
      resources :comments, default: { format: :json }, except: [ :new, :edit]
    end
  end

  root 'site#index'
end