class TasksController < ApplicationController

    get '/tasks' do 
        "A list of publically avaialble tasks"
    end

    get '/tasks/new' do 
        # Checking if they are logged in
        if !session[:email]
            redirect "/login" # Redirecting if they aren't
        else
            "A new post form" # Rendering if they are
        end
    end

    get '/tasks/:id/edit' do
        # Checking if they are logged in
        if !session[:email]
            redirect "/login" # Redirecting if they aren't
        else
            "An edit post form" # Rendering if they are
        end
    end

end