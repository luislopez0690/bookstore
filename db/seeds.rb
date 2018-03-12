

u1 = User.find_or_create_by(name: "luis", password: "luis", user_type: "admin")
u2 = User.find_or_create_by(name: "armando", password: "armando", user_type: "regular")
u3 = User.find_or_create_by(name: "javier", password: "javier", user_type: "regular")

b1 = Book.find_or_create_by(name: "Roughing it", author: "Mark Twain", summary: "", description: "",image_url: "", price: 10.0, amount: 10)
b2 = Book.find_or_create_by(name: "A Tramp Abroad", author: "Mark Twain", summary: "", description: "", image_url: "", price: 10.0, amount: 10)
b3 = Book.find_or_create_by(name: "Following the Equator", author: "Mark Twain" , summary: "", description: "", image_url: "", price: 10.0, amount: 10)
b4 = Book.find_or_create_by(name: "Life on the Mississipi", author: "Mark Twain" , summary: "", description: "", image_url: "", price: 10.0, amount: 10)

150.times do
  Book.find_or_create_by(name: Faker::Book.title, author: Faker::Book.author, summary: "", description: "",image_url: "",price: Faker::Number.between(1.0,25.00), amount: Faker::Number.between(1,50))
end
