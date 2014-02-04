require 'spec_helper'

describe "Editing todo" do
	let!(:todo) { Todo.create(title: "Groceries", description: "Grocery list.") }

	it "is successful when clicking the destroy link" do
		visit "/todo"

		within "#todo_#{todo.id}" do
			click_link "Destroy"
		end
		expect(page).to_not have_content(todo.title)
		expect(Todo.count).to eq(0)
	end
end


	def update_todo(options={})
		options[:title] ||= "My todo list"
		options[:description] ||= "This is my todo list."
		todo = options[:todo]

		visit "/todo"
		within "#todo_#{todo.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Create Todo list"
	end

	it "updates a todo list successfully with correct information" do
		
		update_todo todo: todo, 
					title: "New title", 
					description: "New description"

		todo.reload

		expect(page).to have_content("Todo list was successfully updated")
		expect(todo.title).to eq("New title")
		expect(todo.description).to eq("New description")
	end
end