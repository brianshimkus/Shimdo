require 'spec_helper'

describe "todos/edit" do
  before(:each) do
    @todo = assign(:todo, stub_model(Todo,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", todo_path(@todo), "post" do
      assert_select "input#todo_title[name=?]", "todo[title]"
      assert_select "textarea#todo_description[name=?]", "todo[description]"
    end
  end
end
