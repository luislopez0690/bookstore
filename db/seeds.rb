

u1 = User.find_or_create_by(name: "luis", password: "luis", user_type: "admin")
u2 = User.find_or_create_by(name: "armando", password: "armando", user_type: "regular")
u3 = User.find_or_create_by(name: "javier", password: "javier", user_type: "regular")

b1 = Book.find_or_create_by(name: "Roughing it", author: "Mark Twain", short_description: "", long_description: "",image_url: "", price: 10.0, amount: 10)
b2 = Book.find_or_create_by(name: "A Tramp Abroad", author: "Mark Twain", short_description: "", long_description: "", image_url: "", price: 10.0, amount: 10)
b3 = Book.find_or_create_by(name: "Following the Equator", author: "Mark Twain" , short_description: "", long_description: "", image_url: "", price: 10.0, amount: 10)
b4 = Book.find_or_create_by(name: "Life on the Mississipi", author: "Mark Twain" , short_description: "", long_description: "", image_url: "", price: 10.0, amount: 10)

usb1 = UsersBook.find_or_create_by(user: u1, book: b1)
usb2 = UsersBook.find_or_create_by(user: u1, book: b2)
usb3 = UsersBook.find_or_create_by(user: u2, book: b3)
