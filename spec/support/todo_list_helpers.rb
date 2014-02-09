module TodoHelpers
	def visit_todo(list)
		visit "/todo"
		within dom_id_for(list) do
			click_link "List Items"
		end
	end
end