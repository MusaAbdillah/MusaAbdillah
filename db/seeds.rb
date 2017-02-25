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
roles = Role.create!([{id:1}, { nama: "owner"}], [{id:2}, { nama: "admin"}], [{id:3}, { nama: "user"}]) 
