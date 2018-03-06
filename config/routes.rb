Rails.application.routes.draw do
  get '/contact_list' => 'contacts#show_my_contacts'
end
