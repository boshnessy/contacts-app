require 'unirest'

p "Here is your first contact:"
response = Unirest.get("http://localhost:3000/contact_list")

p response.body