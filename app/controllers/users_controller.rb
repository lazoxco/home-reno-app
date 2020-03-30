require './config/environment'

class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(
      name: params[:name],
      email: params[:email], 
      password: params[:password]
    )
    session[:user_id] = @user.id
    binding.pry
    redirect "/users/#{@user.id}"
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    # want to find the user if it exists
    @user = User.find_by(username: params[:useranme])

    # authenticate password
    
  end

  get '/users/:id' do 
    @user = User.find(params[:id])
    erb :'/users/show'
  end
end