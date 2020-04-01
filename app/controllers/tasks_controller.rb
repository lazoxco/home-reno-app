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
    @task = Task.new(
      title: params[:title], 
      content: params[:content],
      user_id: current_user.id
    )

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
    erb :'/tasks/edit'
  end

  patch '/tasks/:id' do
    @task = Task.find(params[:id])
    @task.update(title: params[:title], content: params[:content])
    redirect "/tasks/#{@task.id}"
  end

# Delete

  delete '/tasks/:id' do
    @task = Task.find(params[:id])
    @task.destroy
    redirect '/tasks'
  end
end