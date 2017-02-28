# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
OrderStatus.delete_all
o1 = OrderStatus.create(id: 1, nama: "proses")
o2 = OrderStatus.create(id: 2, nama: "batal")
o3 = OrderStatus.create(id: 3, nama: "berhasil")

#seed data user

#seed data role
Role.delete_all
r0 = Role.create(id: 1, nama: "owner")
r1 = Role.create(id: 2, nama: "admin")
r2 = Role.create(id: 3, nama: "user")
