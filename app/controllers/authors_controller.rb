class AuthorsController < ApplicationController
  get "/authors" do
    # render all of the authors as JSON
    Author.all.to_json(include: [books: {only: [:id, :title]}], except: [:created_at, :updated_at])
  end

  get "/authors/:id" do
    find_author
    author_to_json
  end

  post "/authors" do
    @author = Author.new(params)
    if @author.save
      # return object as json if saved
      author_to_json
    else
      # return error messages if not saved
      author_error_messages
    end
  end

  patch "/authors/:id" do
    find_author
    if @author.update(params)
      author_to_json
    else
      author_error_messages
    end
  end

  delete "/authors/:id" do
    find_author
    if @author
      @author.destroy
      @author.to_json
    else
      { errors: ["Author Doesn't Exist"] }.to_json
    end
  end

  private
    def find_author
      @author = Author.find_by_id(params["id"])
    end

    def author_to_json
      @author.to_json(include: [:books])
    end

    def author_error_messages
      { errors: @author.errors.full_messages }.to_json
    end
end