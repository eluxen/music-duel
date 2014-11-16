# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_role = Role.find_or_initialize_by(name: 'user', title: 'role for user', description: 'user')
user_role.update_attributes(the_role: {votes: true, duels: {show: true}, artists: {show: true}})