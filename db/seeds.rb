# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(name: "etc")
Category.create(name: "Cafe")
Category.create(name: "Convenience")
Category.create(name: "Food")
Category.create(name: "Movie Theater")
Category.create(name: "Education")
User.create(email: "admin@gmail.com", password: "admin1", name: "admin")