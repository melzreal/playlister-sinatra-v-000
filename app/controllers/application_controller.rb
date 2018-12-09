class ApplicationController < Sinatra::Base
  use Rack::Flash

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end
end
