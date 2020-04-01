class SessionsController < ApplicationController

    get '/login' do
        erb :'/users/login'
      end
    
    post '/login' do
      # want to find the user if it exists
      @user = User.find_by(email: params[:email])
  
      if @user && @user.authenticate(params[:password])
        # authenticate password
        session[:user_id] = @user.id
        # redirect "/users/#{@user.id}"
        redirect "/tasks"
      else
        redirect '/login'
      end
    end

    get '/logout' do
      session.clear
      redirect '/'
    end

end