class TasksController < ApplicationController

  # get '/tasks' do 
  #   # erb :"tasks"
  #   "A list of publicly available tasks"
  # end

# Create
  get '/tasks/new' do 
    # Checking if they are logged in
    if !logged_in?
        redirect "/login" # Redirecting if they aren't
    else
        "Render a new post form" # Rendering if they are
        erb :'/tasks/new'
    end
  end

  post '/tasks' do 
    @task = Task.create(title: params[:title], content: params[:content])
    redirect "/tasks/#{@task.id}"
  end

# Read
  
  get '/tasks/:id' do
    @task = Task.find(params[:id])
    erb :'tasks/show'
  end

  get '/tasks' do
    @tasks = Task.all #returns an array
    erb :'tasks/index'
  end

# Update

  get '/tasks/:id/edit' do
    # Checking if they are logged in
    if !logged_in?
      redirect "/login" # Redirecting if they aren't
    else
      if task = current_user.tasks.find(params[:id])
          @task = Task.find(params[:id])
          erb :'tasks/edit'
      else 
          redirect '/tasks'
      end
    end
  end
end