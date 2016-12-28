# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create(:nama => 'user')
r2 = Role.create(:nama => 'admin')
us1 = User.create(:email => 'user@gmail.com' , :password => 'q1w2e3r4', :role_id => r1.id)
us2 = User.create(:email => 'admin@gmail.com' , :password => 'q1w2e3r4', :role_id => r2.id)

OrderStatus.delete_all
OrderStatus.create! id: 1, nama: "In Progress"
OrderStatus.create! id: 2, nama: "Placed"
OrderStatus.create! id: 3, nama: "Shipped"
OrderStatus.create! id: 4, nama: "Cancelled"
