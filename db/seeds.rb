# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
OrderStatus.delete_all
OrderStatus.create! id: 1, nama: "proses"

#seed data user

#seed data role
Role.delete_all
Role.create! id:1, nama: "owner"
Role.create! id:2, nama: "admin"
Role.create! id:3, nama: "user"


#seed data user
User.delete_all
User.create! id:2, email: "owner@abtech.com", encrypted_password: "tOOr%powerr99", role_id: 1
