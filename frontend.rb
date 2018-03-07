require 'unirest'

# one contact
p "Here is your first contact:"
response = Unirest.get("http://localhost:3000/v1/contact_list")

contact = response.body

p "first name: #{contact["first_name"]}"
p "last name: #{contact["last_name"]}"
p "email: #{contact["email"]}"
p "phone number: #{contact["phone_number"]}"


# all contacts
response = Unirest.get("http://localhost:3000/v1/all_contacts")
contacts = response.body

# loop through contacts, print out each
contacts.each do |contact|
  p "first name: #{contact["first_name"]}"
  p "last name: #{contact["last_name"]}"
  p "email: #{contact["email"]}"
  p "phone number: #{contact["phone_number"]}"
  p "------------------------"
end