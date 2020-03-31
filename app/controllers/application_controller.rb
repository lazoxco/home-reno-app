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
  
  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def logout!
      session.clear
    end
  end

  get "/" do
    erb :index
  end
end
