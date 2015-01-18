# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RoleUser.delete_all
User.delete_all
Role.delete_all

r = Role.create({name: :admin, info: 'Администратор системы'})
u = User.create({login: :radigin, info: 'Радыгин В.Ю.'})
ru = RoleUser.create(role: r, user: u)
