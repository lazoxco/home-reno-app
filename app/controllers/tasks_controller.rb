class TasksController < ApplicationController

    get '/tasks' do 
        "A list of publicly available posts"
    end

    get '/tasks/new' do 
        # Checking if they are logged in
        if !logged_in?
            redirect "/login" # Redirecting if they aren't
        else
            "Render a new post form" # Rendering if they are
        end
    end

    get '/tasks/:id/edit' do
        # Checking if they are logged in
        if !logged_in?
            redirect "/login" # Redirecting if they aren't
        else
            if task = current_user.tasks.find(params[:id])
                "An edit task form #{current_user.id} is editing #{task.id}" # Rendering if they are
            else 
                redirect '/tasks'
            end
        end
    end

end