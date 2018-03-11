require 'unirest'

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
# p "Enter the id of the contact you wish to update"
# contact_id = gets.chomp
# p "Enter a first_name:"
# first_name = gets.chomp
# p "Enter a last_name:"
# last_name = gets.chomp
# p "Enter an email:"
# email = gets.chomp
# p "Enter a phone_number:"
# phone_number = gets.chomp

# response = Unirest.patch("localhost:3000/v2/contacts/#{contact_id}", parameters: {
#   input_first_name: first_name,
#   input_last_name: last_name,
#   input_email: email,
#   input_phone_number: phone_number
# })

# p "You successfully updated your contact."


# DESTROY
p "Enter the id of the contact you wish to delete"
contact_id = gets.chomp

response = Unirest.delete("localhost:3000/v2/contacts/#{contact_id}")
puts JSON.pretty_generate(response.body)