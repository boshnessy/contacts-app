Rails.application.routes.draw do
  namespace :v1 do
    get '/contact_list' => 'contacts#show_my_contacts'
    get '/all_contacts' => 'contacts#all_contacts'
  end

  namespace :v2 do
    get '/contact_list' => 'contacts#show_my_contacts'
    get '/all_contacts' => 'contacts#all_contacts'
  end
end
