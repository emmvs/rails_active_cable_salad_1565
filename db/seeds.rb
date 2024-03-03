puts "Cleaning Database 🧼"
sleep 1
Message.destroy_all
Chatroom.destroy_all
User.destroy_all

puts "Creating Chatrooms 💬"
sleep 1
Chatroom.create(name: "general 🤷🏼‍♀️")
Chatroom.create(name: "memes 😂")

puts "Creating Users 🤷🏼‍♀️ 🙋🏼‍♂️ 🙆🏽‍♂️ 💁🏼‍♂️"
sleep 1
User.create(email: "emma@test.com", nickname: "Emma ☀️", password: "123456")
User.create(email: "lucas@test.com", nickname: "Lucas 🐸", password: "123456")
User.create(email: "pedro@test.com", nickname: "Pedro 💚", password: "123456")
User.create(email: "josh@test.com", nickname: "Josh 🍰", password: "123456")

puts "Done 🌱🌱🌱"