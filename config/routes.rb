Rails.application.routes.draw do
  get '/contact_list' => 'contacts#show_my_contacts'
  get '/all_contacts' => 'contacts#all_contacts'
end
