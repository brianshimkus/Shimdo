require 'spec_helper'

describe "Viewing todo items" do
	let!(:todo) { Todo.create(title: "Groceries", description: "Grocery list.") }

	def visit_todo(list)
		visit "/todo"
		within "#todo_#{list.id}" do
			click_link "List Items"
		end
	end

	it "display the title of the todo list" do
		visit_todo(todo_list)
		within("h1") do
			expect(page).to have_content(todo.title)
		end
	end

	it "displays no items when the todo list is empty" do
		visit_todo(todo)
		expect(page.all("ul.todo_items li").size).to eq(0)
	end

	it "displays item content when a todo list items" do
		todo.todo_items.create(content: "Milk")
		todo.todo_items.create(content: "Eggs")
		
		visit_todo(todo)
		
		expect(page.all("ul.todo_items li").size).to eq(2)
		
		within "ul.todo_items" do
			expect(page).to have_content("Milk")
			expect(page).to have_content("Eggs")
		end
	end
end