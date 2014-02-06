require 'spec_helper'

describe "Viewing todo items" do
	let!(:todo) { Todo.create(title: "Groceries", description: "Grocery list.") }

	def visit_todo(list)
		visit "/todo"
		within "#todo_#{list.id}" do
			click_link "List Items"
		end
	end

it "is successful with valid content" do
	visit_todo(todo)
	click_link "New Todo Item"
	fill_in "Content", with: "Milk"
	click_button "Save"
	expect(page).to have_content("Added todo list item.")
	within("ul.todo_items") do
		expect(page).to have_content("Milk")
	end

end