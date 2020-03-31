require './config/environment'

class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/new'
  end

  post '/signup' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect "/tasks"
    else
      redirect "/signup"
    end
  end

  get '/users/:id' do 
    @user = User.find(params[:id])
    erb :'/users/show'
  end
end