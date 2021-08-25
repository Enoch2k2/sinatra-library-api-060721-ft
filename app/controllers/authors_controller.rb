class AuthorsController < ApplicationController
  get "/authors" do
    # render all of the authors as JSON
    Author.all.to_json(include: [books: {only: [:id, :title]}], except: [:created_at, :updated_at])
  end

  get "/authors/:id" do
    author = Author.find_by_id(params["id"])
    author.to_json(include: [:books])
  end

  post "/authors" do
    author = Author.new(params)
    if author.save
      # return object as json if saved
      author.to_json(include: [:books])
    else
      # return error messages if not saved
      { errors: author.errors.full_messages }.to_json
    end
  end

  patch "/authors/:id" do
    author = Author.find_by_id(params["id"])
    if author.update(params)
      author.to_json(include: [:books])
    else
      { errors: author.errors.full_messages }.to_json
    end
  end

  delete "/authors/:id" do
    author = Author.find_by_id(params["id"])
    if author
      author.destroy
      author.to_json
    else
      { errors: ["Author Doesn't Exist"] }.to_json
    end
  end
end