class TasksController < ApplicationController

# Create
  get '/tasks/new' do 
    # Checking if they are logged in
    if !logged_in?
        redirect "/login" # Redirecting if they aren't
    else
        erb :'/tasks/new'
    end
  end

  post '/tasks' do 
    @task = current_user.tasks.build(params)

    if @task.save
      redirect "/tasks/#{@task.id}"
    else
      redirect '/tasks/new'
    end
    
  end

# Read
  
  get '/tasks/:id' do
    @task = Task.find(params[:id])
    erb :'/tasks/show'
  end

  get '/tasks' do
    if !logged_in?
      redirect '/login'
    else
      @tasks = current_user.tasks #returns an array
      erb :'/tasks/index'
    end
  end

# Update

  get '/tasks/:id/edit' do    
    @task = Task.find(params[:id])
      if current_user.id == @task.user_id
    erb :'/tasks/edit'
    else
      redirect '/login'
    end
  end

  patch '/tasks/:id' do
    @task = Task.find(params[:id])
    if @task.update(title: params[:title], content: params[:content])
      redirect "/tasks/#{@task.id}"
    else
      erb :'/tasks/edit'
    end
    
  end

# Delete

  delete '/tasks/:id' do
    @task = Task.find(params[:id])
    @task.destroy
    redirect '/tasks'
  end
end