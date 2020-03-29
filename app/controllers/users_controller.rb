require './config/environment'

class UsersController < ApplicationController

  get '/signup' do
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      redirect '/login'
    else
      erb :"users/new"
    end
  end

  get '/users/:id' do 
    @user = User.find(params[:id])
    erb :'/users/show'
  end
end