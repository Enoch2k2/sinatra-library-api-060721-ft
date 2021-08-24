# steven = Author.create(name: "Steven King") # id 1
# tolkien = Author.create(name: "J.R.R. Tolkien") # id 2
# rowling = Author.create(name: "J.K. Rowling") # id 3

# it = Book.create(title: "IT", genre: "Horror", author_id: steven.id)
# last_stand = Book.create(title: "Last Stand", genre: "Horror", author_id: steven.id)
# the_hobbit = Book.create(title: "The Hobbit", genre: "Fantasy", author_id: tolkien.id)
# the_fellowship_of_the_ring = Book.create(title: "The Fellowship Of The Ring", genre: "Fantasy", author_id: tolkien.id)
# sorcerors_stone = Book.create(title: "Sorceror's Stone", genre: "Fantasy", author_id: rowling.id)

tolkien = Author.second
steven = Author.first

# Book.create([
#   {title: "The Two Towers", genre: "Fantasy", author: tolkien},
#   {title: "The Shinning", genre: "Horror", author: steven}
# ])

tolkien.books.create(title: "The Return Of The King", genre: "Fantasy")

puts "Done Seeding"