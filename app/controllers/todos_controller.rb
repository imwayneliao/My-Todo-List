class TodosController < ApplicationController
    before_action :set_todo, :only => [:show, :edit, :update, :destroy, :complete]
  def index
    @todos = Todo.all
  end
  def new
    @todo = Todo.new
  end
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_url
    else
      render :new
    end
  end
  def show
  end
  def update
    if @todo.update_attributes(todo_params)
      redirect_to todos_path(@todo)
    else
      render :edit
    end
  end
  def complete
    if @todo.completed == false
      @todo.update_attribute(:completed, true)
    else
      @todo.update_attribute(:completed, false)
    end
    redirect_to todos_path(@todo)
  end

  def destroy
    @todo.destroy
    redirect_to todos_url
  end
   
  private
  def set_todo
    @todo = Todo.find(params[:id])
  end
  def todo_params
    params.require(:todo).permit(:title, :due_date, :note, :completed)
  end
end
