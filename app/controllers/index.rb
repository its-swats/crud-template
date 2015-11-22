enable :sessions
use Rack::Flash

get '/' do
  # Look in app/views/index.erb
  erb :index
end
