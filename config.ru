require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser

use AuthorsController
use BooksController
run ApplicationController
