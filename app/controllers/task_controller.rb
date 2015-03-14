class TaskController < ApplicationController
  def index
    @tasks = Task.all
  end


  def show
    @task = Task.find(params[:id])
  end


  def new
    @task = Task.new

    if @task.save
      flash[:notice] = "Task was saved."
      redirect_to @tasks
    else
      flash[:error] = "There was an error saving the task. Please try again."
      render :new
    end
  end


  def edit
    @task = Task.find(params[:id])
    
    if @task.save
      flash[:notice] = "Task was updated."
      redirect_to @tasks
    else
      flash[:error] = "There was an error updating the task. Please try again."
      render :show #:new??
    end
  end


def destroy
     @task = Task.find(params[:id])
     name = @task.name
 
     if @tasks.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       redirect_to @tasks
     else
       flash[:error] = "There was an error deleting the task."
       render :show
     end
   end

end #CLASS END
