class V2::ContactsController < ApplicationController
  def show_my_contacts
    contact1 = Contact.first

    # render json: {first_name: contact1.first_name, last_name: contact1.last_name, email: contact1.email, phone_number: contact1.phone_number}
    render json: contact1.as_json # same but also includes id, created at, updated at
  end

  def all_contacts
    contacts = Contact.all
    #make an empty array
    contacts_hashes = []
    #loop through all contacts  
    contacts.each do |contact|
      #make a hash for each contact
      the_contact_hash = {firstName: contact.first_name, lastName: contact.last_name, email: contact.email, phoneNumber: contact.phone_number}
      #shovel hash into array
      contacts_hashes << the_contact_hash
    end
    render json: contacts_hashes # already a hash -> don't need hash brackets
  end

  def index
    render json: {message: "hi"}
  end
end