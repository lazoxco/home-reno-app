require './config/environment'

class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/new'
  end

  post '/signup' do
    if params[:name] == "" && params[:email] == "" && params[:password] == ""
      redirect "/signup"
    else
      @user = User.create(
      name: params[:name],
      email: params[:email], 
      password: params[:password]
    )
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end
  end

  get '/login' do
    if logged_if?
      erb :'/users/login'
    else
      @user = User.find(session[:user_id])
      redirect "/users/#{@user.id}"
    end
  end

  post '/login' do
    # want to find the user if it exists
    @user = User.find_by(email: params[:email])

    if @user
      # authenticate password
      @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/login"
    end

  end

  get '/users/:id' do 
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end