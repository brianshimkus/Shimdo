class TodoItemsController < ApplicationController
  def index
  	@todo = Todo.find(params[:todo_id])
  end

  def new
  	@todo = Todo.find(params[:todo_id])
  	@todo_item = @todo.todo_items.new
  end

  def create
  	@todo = Todo.find(params[:todo_id])
  	@todo_item = @todo.todo_items.new(todo_item_params)
  	if @todo_item.save
  		flash[:success] = "Added todo list item."
  		redirect_to todo_todo_items_path
  	else
  		flash[:error] = "There was a problem adding that todo list item."
  		render action: :new
  	end
  end

  private
  def todo_item_params
  	params[:todo_item].permit(:content)
  end
end