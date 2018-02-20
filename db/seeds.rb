

u1 = User.create(name: "luis", password: "luis", user_type: "admin")
u2 = User.create(name: "armando", password: "armando", user_type: "regular")
u3 = User.create(name: "javier", password: "javier", user_type: "regular")

b1 = Book.create(name: "Roughing it", author: "Mark Twain", short_description: "", long_description: "",image_url: "", price: 10.0, amount: 10)
b2 = Book.create(name: "A Tramp Abroad", author: "Mark Twain", short_description: "", long_description: "", image_url: "", price: 10.0, amount: 10)
b3 = Book.create(name: "Following the Equator", author: "Mark Twain" , short_description: "", long_description: "", image_url: "", price: 10.0, amount: 10)
b4 = Book.create(name: "Life on the Mississipi", author: "Mark Twain" , short_description: "", long_description: "", image_url: "", price: 10.0, amount: 10)
