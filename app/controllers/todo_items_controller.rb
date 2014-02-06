class TodoItemsController < ApplicationController
  def index
  	@todo = Todo.find(params[:todo_id])
  end
end
