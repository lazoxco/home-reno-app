require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :view, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :index
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  # get '/registrations/signup' do
  #   erb :'/registrations/signup'
  # end

  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
  end

end
