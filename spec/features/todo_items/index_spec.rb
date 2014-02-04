require 'spec_helper'

describe "Viewing todo items" do
	let!(:todo) { Todo.create(title: "Groceries", description: "Grocery list.") }
	it "displays no items when the todo list is empty" do
		visit "/todo"
		within "#todo_#{todo.id}" do
			click_link "List Items"
		end
		expect(page).to have_content("TodoItems#index")
	end
end