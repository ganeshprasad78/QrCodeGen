# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

production = Role.create({ name: 'Production', description: 'Production' })
marketing = Role.create({ name: 'Marketing', description: 'Marketing' })
technical = Role.create({ name: 'Technical', description: 'Technical' })
printer = Role.create({ name: 'Printer', description: 'Printing' })
role = Role.create({ name: 'Admin' })

User.create({ first_name: 'Production', last_name: 'Team', email: 'production@qrcode.com', password: 'qrcode.com', password_confirmation: 'qrcode.com', role_id: production.id })
User.create({ first_name: 'Admin', last_name: 'Account', email: 'admin@qrcode.com', password: 'qrcode.com', password_confirmation: 'qrcode.com', role_id: role.id })
User.create({ first_name: 'Marketing', last_name: 'Team', email: 'marketing@qrcode.com', password: 'qrcode.com', password_confirmation: 'qrcode.com', role_id: marketing.id })
User.create({ first_name: 'Technical', last_name: 'Team', email: 'technical@qrcode.com', password: 'qrcode.com', password_confirmation: 'qrcode.com', role_id: technical.id })
User.create({ first_name: 'Printer', last_name: 'Team', email: 'printer@qrcode.com', password: 'qrcode.com', password_confirmation: 'qrcode.com', role_id: printer.id })
