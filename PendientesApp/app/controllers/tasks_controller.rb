class TasksController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
  
    def index
      @pending_tasks = current_user.tasks.where(completed: false)
    end
  
    def completed
      @completed_tasks = current_user.tasks.where(completed: true)
    end
  
    def create
      @task = current_user.tasks.build(task_params)
      @task.completed = false
  
      if @task.save
        redirect_to tasks_path, notice: 'Tarea creada con éxito.'
      else
        @pending_tasks = current_user.tasks.where(completed: false)
        render :index, alert: 'No se pudo crear la tarea.'
      end
    end
  
    def update
      @task = current_user.tasks.find(params[:id])
      if @task.completed
        @task.update(completed: false, completed_at: nil)
      else
        @task.update(completed: true, completed_at: Time.current)
      end
      redirect_to tasks_path
    end
  
    private
  
    def task_params
      params.require(:task).permit(:title)
    end
  end
  
  