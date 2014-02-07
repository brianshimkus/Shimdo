require 'spec_helper'

describe "Deleting todo items" do
	let!(:todo) { Todo.create(title: "Groceries", description: "Grocery list.") }
	left!(:todo_item) { todo.todo_items.create(content: "Milk") }

	def visit_todo(list)
		visit "/todo"
		within "#todo_#{list.id}" do
			click_link "List Items"
		end
	end


	it "is successful" do
		visit_todo(todo)
		within "#todo_item_#{todo_item.id}" do
			click_link "Delete"
		end
		expect(page).to have_content("Todo list item was deleted.")
		expect(TodoItem.count).to eq(0)
end