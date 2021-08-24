require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "rake console"
task :console do 
    Pry.start
end

desc "reset database"
task :reset_db do
    puts "dropping database..."
    system "rm ./db/development.sqlite"
    system "rm ./db/test.sqlite"
    system "rm ./db/schema.rb"
    puts "migrating database..."
    system "rake db:migrate && rake db:migrate SINATRA_ENV=test"
    system "rake db:seed"
    system "shotgun"
end
