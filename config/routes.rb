Rails.application.routes.draw do
  namespace :v1 do
    get '/contact_list' => 'contacts#show_my_contacts'
    get '/all_contacts' => 'contacts#all_contacts'
  end

  namespace :v2 do
    get '/contacts' => 'contacts#index'
    get '/contacts/:id' => 'contacts#show'
    post '/contacts' => 'contacts#create'
    patch '/contacts/:id' => 'contacts#update'
    delete '/contacts/:id' => 'contacts#destroy'
  end
end