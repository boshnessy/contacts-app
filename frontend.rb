require 'unirest'

# INDEX
# Search by specific first name
# p "Enter the first name of the contact"
# search_term = gets.chomp

# response = Unirest.get("http://localhost:3000/v2/contacts?search=#{search_term}")
# p response.body

# # CREATE
# p "Enter a first_name:"
# first_name = gets.chomp
# p "Enter a middle_name:"
# middle_name = gets.chomp
# p "Enter a last_name:"
# last_name = gets.chomp
# p "Enter an email:"
# email = gets.chomp
# p "Enter a phone_number:"
# phone_number = gets.chomp
# p "Enter an address:"
# address = gets.chomp
# p "Enter a bio:"
# bio = gets.chomp

# response = Unirest.post("localhost:3000/v2/contacts", parameters: {
#   input_first_name: first_name,
#   input_middle_name: middle_name,
#   input_last_name: last_name,
#   input_email: email,
#   input_phone_number: phone_number,
#   input_address: address,
#   input_bio: bio
#   })

# contact = response.body
# puts contact


# # UDPATE
# p "Enter the id of the contact you wish to update"
# contact_id = gets.chomp
# p "Enter a first_name:"
# first_name = gets.chomp
# p "Enter a middle_name:"
# middle_name = gets.chomp
# p "Enter a last_name:"
# last_name = gets.chomp
# p "Enter an email:"
# email = gets.chomp
# p "Enter a phone_number:"
# phone_number = gets.chomp
# p "Enter an address:"
# address = gets.chomp
# p "Enter a bio:"
# bio = gets.chomp

# response = Unirest.patch("localhost:3000/v2/contacts/#{contact_id}", parameters: {
#   input_first_name: first_name,
#   input_middle_name: middle_name,
#   input_last_name: last_name,
#   input_email: email,
#   input_phone_number: phone_number,
#   input_address: address,
#   input_bio: bio
# })

# p "You successfully updated your contact."


# # DESTROY
# p "Enter the id of the contact you wish to delete"
# contact_id = gets.chomp

# response = Unirest.delete("localhost:3000/v2/contacts/#{contact_id}")
# puts JSON.pretty_generate(response.body)

#SIGNUP
response = Unirest.post("localhost:3000/v2/users", 
  parameters: {
    name: "Calvino",
    email: "calvino@calvino.com",
    password: "password",
    password_confirmation: "password"
  }
)

user = response.body

#LOGIN
