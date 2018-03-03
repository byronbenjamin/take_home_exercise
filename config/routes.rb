Rails.application.routes.draw do
  resources :loans, defaults: {format: :json}

  resources :payments, defaults: {format: :json}

  # custom route for creating payment for specific loan
  post '/loans/:loan_id/payments' => "payments#create", defaults: {format: :json}

end
