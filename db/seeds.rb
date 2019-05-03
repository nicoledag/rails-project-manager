# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Tested associations
user = User.create(username: "Nicole", email: "nicole@email.com", password: "hello767")
client = Client.create(name: "Donna", email: "donna@email.com", phone: "222-222-2222", street_address: "22 Peach Rd", city: "NY", state: "New York", zip: 10001, company: "Macys")

user.projects.create(client: client)
