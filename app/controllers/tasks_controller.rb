class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end


  def show
    @task = Task.find(params[:id])
  end


  def new
    @task = Task.new

  end

  def create
    @task = Task.new(params.require(:task).permit(:title))
    @task.expires_at = Time.now+7.days
    if @task.save
      flash[:notice] = "Task was saved."
      redirect_to tasks_path
    else
      flash[:error] = "There was an error saving the task. Please try again."
      render :new #new takes the user back to the task/new page
    end
  end


  def edit
    @task = Task.find(params[:id])
    
    if @task.save
      flash[:notice] = "Task was updated."
      redirect_to @tasks
    else
      flash[:error] = "There was an error updating the task. Please try again."
      render :show # show takes the user back to the unchanged task/show page
    end
  end


def destroy
     @task = Task.find(params[:id])
     name = @task.title
 
     if @task.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       redirect_to tasks_path
     else
       flash[:error] = "There was an error deleting the task."
       render :show # show takes the user back to the unchanged task/show page
     end
   end

end #CLASS END
