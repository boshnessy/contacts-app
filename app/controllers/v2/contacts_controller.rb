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
    contacts = Contact.all

    render json: contacts.as_json
  end

  def show
    id = params[:id]
    contact = Contact.find_by(id: id)

    render json: contact.as_json
  end

  def create
    contact1 = Contact.new(
      first_name: params[:input_first_name], 
      last_name: params[:input_last_name], 
      email: params[:input_email], 
      phone_number: params[:input_phone_number]
    )
    contact1.save

    render json: contact1.as_json
  end

  def update
    id = params[:id]
    contact = Contact.find_by(id: id)
    contact.update(
      first_name: params[:input_first_name], 
      last_name: params[:input_last_name], 
      email: params[:input_email], 
      phone_number: params[:input_phone_number]
    )

    render json: contact.as_json
  end

  def destroy
    id = params[:id]
    contact = Contact.find_by(id: id)
    contact.delete

    render json: {message: "You successfully deleted your contact."}
  end
end