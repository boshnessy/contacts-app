require 'unirest'

while true
  puts "What do you want to do?"
  puts     "[1] See all contacts"
  puts     "[2] See one contact"
  puts     "[3] Create a contact"
  puts     "[4] Update a contact"
  puts     "[5] Delete a contact"
  puts     "[6] Sign up"
  puts     "[7] Log in"
  puts     "[8] Log out"
  puts     "[q] Quit"

  user_input = gets.chomp
  system "clear"

  if user_input == "1"
    # See all contacts
    response = Unirest.get("http://localhost:3000/v2/contacts")
    contacts = response.body

    puts JSON.pretty_generate(contacts)

  elsif user_input == "2"
    # See one contact
    puts "Enter the first name of the contact you wish to view"
    search_term = gets.chomp

    response = Unirest.get("http://localhost:3000/v2/contacts?search=#{search_term}")
    puts response.body

  elsif user_input == "3"
    # Create a contact
    puts "Enter a first_name:"
    first_name = gets.chomp
    puts "Enter a middle_name:"
    middle_name = gets.chomp
    puts "Enter a last_name:"
    last_name = gets.chomp
    puts "Enter an email:"
    email = gets.chomp
    puts "Enter a phone_number:"
    phone_number = gets.chomp
    puts "Enter an address:"
    address = gets.chomp
    puts "Enter a bio:"
    bio = gets.chomp

    response = Unirest.post("localhost:3000/v2/contacts", parameters: {
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      email: email,
      phone_number: phone_number,
      address: address,
      bio: bio
      }
    )

    contact = response.body
    puts contact

  elsif user_input == "4"
    # Update a contact
    puts "Enter the id of the contact you wish to update"
    contact_id = gets.chomp
    puts "Enter a first_name:"
    first_name = gets.chomp
    puts "Enter a middle_name:"
    middle_name = gets.chomp
    puts "Enter a last_name:"
    last_name = gets.chomp
    puts "Enter an email:"
    email = gets.chomp
    puts "Enter a phone_number:"
    phone_number = gets.chomp
    puts "Enter an address:"
    address = gets.chomp
    puts "Enter a bio:"
    bio = gets.chomp

    response = Unirest.patch("localhost:3000/v2/contacts/#{contact_id}", parameters: {
        input_first_name: first_name,
        input_middle_name: middle_name,
        input_last_name: last_name,
        input_email: email,
        input_phone_number: phone_number,
        input_address: address,
        input_bio: bio
      }
    )
    puts "*" * 20
    puts "You successfully updated your contact."

  elsif user_input == "5"
    # Delete a contact
    puts "Enter the id of the contact you wish to delete"
    contact_id = gets.chomp

    response = Unirest.delete("localhost:3000/v2/contacts/#{contact_id}")
    puts JSON.pretty_generate(response.body)

  elsif user_input == "6"
    # Sign up
    puts "Enter a name"
    input_name = gets.chomp
    puts "Enter an email"
    input_email = gets.chomp
    puts "Enter a password"
    input_password = gets.chomp
    puts "Enter password again"
    input_password_confirmation = gets.chomp

    response = Unirest.post("http://localhost:3000/v2/users",
      parameters: {
        name: input_name,
        email: input_email,
        password: input_password,
        password_confirmation: input_password_confirmation
      }
    )
    user = response.body
    puts user
  elsif user_input == "7"
    # Log in
    puts "Enter email"
    input_email = gets.chomp
    puts "Enter password"
    input_password = gets.chomp

    response = Unirest.post("http://localhost:3000/user_token",
      parameters: {
        auth: {
          email: input_email,
          password: input_password
        }
      }
    )

    p response.body

    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")

    response = Unirest.get("localhost:3000/v2/contacts")

    p response.body
  elsif user_input == "8"
    p jwt = ""
    Unirest.clear_default_headers()
    break
  elsif user_input == "q"
    break
  end
end