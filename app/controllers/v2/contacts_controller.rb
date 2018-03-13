class V2::ContactsController < ApplicationController
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
    contact = Contact.new(
      first_name: params[:input_first_name],
      middle_name: params[:middle_name], 
      last_name: params[:input_last_name], 
      email: params[:input_email], 
      phone_number: params[:input_phone_number]
    )
    contact.save

    render json: contact.as_json
  end

  def update
    id = params[:id]
    contact = Contact.find_by(id: id)
    contact.update(
      first_name: params[:input_first_name], 
      middle_name: params[:middle_name], 
      last_name: params[:input_last_name], 
      email: params[:input_email], 
      phone_number: params[:input_phone_number]
    )
    # contact.first_name = params[:input_first_name]
    # contact.middle_name = params[:input_middle_name]
    # contact.last_name = params[:input_last_name]
    # contact.email = params[:input_email]
    # contact.phone_number = params[:input_phone_number]
    # same but need to save after
    # contact.save

    render json: contact.as_json
  end

  def destroy
    id = params[:id]
    contact = Contact.find_by(id: id)
    contact.delete

    render json: {message: "You successfully deleted your contact."}
  end
end