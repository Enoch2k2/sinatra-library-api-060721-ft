class BooksController < ApplicationController
  get "/books" do
    # render all of the books as JSON
    Book.all.to_json(include: [author: {only: [:id, :name]}], except: [:created_at, :updated_at])
  end

  get "/authors/:author_id/books" do
    find_author
    @author.books.to_json(include: [:author])
  end

  get "/books/:id" do
    find_book
    book_to_json
  end

  post "/authors/:author_id/books" do
    find_author
    @book = @author.books.build(params)
    if @book.save
      # return object as json if saved
      book_to_json
    else
      # return error messages if not saved
      book_error_messages
    end
  end

  patch "/books/:id" do
    find_book
    if @book.update(params)
      book_to_json
    else
      book_error_messages
    end
  end

  delete "/books/:id" do
    find_book
    if @book
      @book.destroy
      @book.to_json
    else
      { errors: ["Book Doesn't Exist"] }.to_json
    end
  end

  private
    def find_book
      @book = Book.find_by_id(params["id"])
    end

    def find_author
      @author = Author.find_by_id(params["author_id"])
    end

    def book_to_json
      @book.to_json(include: [:author])
    end

    def book_error_messages
      { errors: @book.errors.full_messages }.to_json
    end
end