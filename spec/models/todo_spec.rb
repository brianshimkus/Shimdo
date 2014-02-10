require 'spec_helper'

describe Todo do
  it { should have_many(:todo_items) }

  describe "#has_complete_items?" do
  	let(:todo_list) { Todo.create(title: "Groceries", description: "Grocery list")}
  	
  	it "returns true with completed todo list items" do
  		todo.todo_items.create(content: "Eggs", completed_at: 1.minute.ago)
  		expect(todo.has_complete_items?).to be_true
  	end

  	it "returns flase with no completed todo list items" do
  		todo.todo_items.create(content: "Eggs")
  		expect(todo.has_complete_items?).to be_false
  	end
  end

  describe "#has_incomplete_items?" do
  	let(:todo_list) { Todo.create(title: "Groceries", description: "Grocery list")}
  	
  	it "returns true with incompleted todo list items" do
  		todo.todo_items.create(content: "Eggs")
  		expect(todo.has_incomplete_items?).to be_true
  	end

  	it "returns flase with no incomplete todo list items" do
  		todo.todo_items.create(content: "Eggs", completed_at: 1.minute.ago)
  		expect(todo.has_incomplete_items?).to be_false
  	end
  end

end
