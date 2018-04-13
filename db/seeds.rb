# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Application.delete_all
apps = [
["Google",	"Search Engine",	"Red", true,	"http:\/\/www.google.com","fab fa-google"],
["Wisc",	"UW homepage",	"Blue", false,	"http:\/\/www.wisc.edu","fas fa-home"],
["GLBRC",	"Great Lakes Bioenergy Research Center",	"Yellow", true,	"http:\/\/www.glbrc.org","fas fa-users"],
["WEI",	"Wisconsin Energy Institute",	"Green", false,	"http:\/\/energy.wisc.edu/","fas fa-burn"],
["Twitter",	"Twitter",	"Purple", false,	"http:\/\/twitter.com/","fab fa-twitter"]
]
apps.each do |app|
    data = Application.new
    data.name = app[0]
    data.description = app[1]
    data.color = app[2]
    data.defaultStatus = app[3]
    data.link = app[4]
    data.icon = app[5]
    data.save!
end


User.delete_all
UserApp.delete_all
users = ["user1","user2","user3"]
users.each do |user|
    data = User.new
    data.login = user
    data.email = "#{user}@example.com"
    data.password = "glbrcpass"
    data.password_confirmation = "glbrcpass"
    data.first = true
    data.save!
end
