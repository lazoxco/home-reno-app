class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/sessions' do
        # Login a user with this email
        login(params[:email])
        redirect '/tasks'
    end

    get '/logout' do
        logout!
        redirect '/tasks'
    end

end