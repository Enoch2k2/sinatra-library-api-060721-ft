require './config/environment'
require 'json'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :default_content_type, 'application/json'
  end

  get "/" do
    erb :welcome
  end

end
