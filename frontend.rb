require 'unirest'

# # one contact
# p "Here is your first contact:"
# response = Unirest.get("http://localhost:3000/v1/contact_list")

# contact = response.body

# p "first name: #{contact["first_name"]}"
# p "last name: #{contact["last_name"]}"
# p "email: #{contact["email"]}"
# p "phone number: #{contact["phone_number"]}"


# # all contacts
# response = Unirest.get("http://localhost:3000/v1/all_contacts")
# contacts = response.body

# # loop through contacts, print out each
# contacts.each do |contact|
#   p "first name: #{contact["first_name"]}"
#   p "last name: #{contact["last_name"]}"
#   p "email: #{contact["email"]}"
#   p "phone number: #{contact["phone_number"]}"
#   p "------------------------"
# end

# CREATE
# p "Enter a first_name:"
# first_name = gets.chomp
# p "Enter a last_name:"
# last_name = gets.chomp
# p "Enter an email:"
# email = gets.chomp
# p "Enter a phone_number:"
# phone_number = gets.chomp

# response = Unirest.post("localhost:3000/v2/contacts", parameters: {
#   input_first_name: first_name,
#   input_last_name: last_name,
#   input_email: email,
#   input_phone_number: phone_number
#   })

# puts JSON.pretty_generate(response.body)


# UDPATE
p "Enter the id of the contact you wish to update"
contact_id = gets.chomp
p "Enter a first_name:"
first_name = gets.chomp
p "Enter a last_name:"
last_name = gets.chomp
p "Enter an email:"
email = gets.chomp
p "Enter a phone_number:"
phone_number = gets.chomp

response = Unirest.patch("localhost:3000/v2/contacts/#{contact_id}", parameters: {
  input_first_name: first_name,
  input_last_name: last_name,
  input_email: email,
  input_phone_number: phone_number
})

p "You successfully updated your contact."