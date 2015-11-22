#To AJAXify
# Convert "Create" form to Partial
# Convert "Edit" form to Partial
# Convert "Login" form to Partial
# Convert "Errors" to a Partial
# Edit Index to display partials through AJAX
# Add Path Handling for AJAX

enable :sessions
use Rack::Flash

get '/' do
  # Look in app/views/index.erb
  erb :index
end
