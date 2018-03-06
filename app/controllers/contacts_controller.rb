class ContactsController < ApplicationController
  def show_my_contacts
    contact1 = Contact.first

    render json: {first_name: contact1.first_name, last_name: contact1.last_name, email: contact1.email, phone_number: contact1.phone_number}
  end
end
