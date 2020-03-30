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

    redirect "/users/#{@user.id}"
  end

  get '/users/:id' do 
    @user = User.find(params[:id])
    erb :'/users/show'
  end
end