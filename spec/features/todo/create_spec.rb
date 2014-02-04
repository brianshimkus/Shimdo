require 'spec_helper'

describe "Creating todo lists" do
	def create_todo(options={})
		options[:title] ||= "My todo list"
		options[:description] ||= "This is my todo list."

		click_link "New todo"
		expect(page).to have_content("New todo")

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Create Todo list"
	end



	it "redirects to the todo list index page on success" do
		create_todo
		expect(page).to have_content("My todo list")
	end

	it "displays an error when the todo list has no title" do
		expect(TodoList.count).to eq(0)

		create_todo title: ""

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo"
		expect(page).to_not have_content("This is what I'm doing today.")

	end

	it "displays an error when the todo list has a title less than 3 characters" do
		expect(TodoList.count).to eq(0)

		create_todo title: "Hi"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo"
		expect(page).to_not have_content("This is what I'm doing today.")

	end

	it "displays an error when the todo list has no description" do
		expect(TodoList.count).to eq(0)

		create_todo title: "Grocery list", description: ""

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo"
		expect(page).to_not have_content("This is what I'm doing today.")

	end

	it "displays an error when the todo list has no description" do
		expect(TodoList.count).to eq(0)

		create_todo title: "Grocery list", description: "Food"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo"
		expect(page).to_not have_content("This is what I'm doing today.")

	end

end