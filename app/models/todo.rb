class Todo < ActiveRecord::Base
	has_many :todo_items

	validates :title, presence: true
	validates :title, length: { minimum: 3 }
	validates :description, presence: true
	validates :description, length: { minimum: 5 }

	def has_completed_items?
		self.todo_items.complete.present?
	end

	def has_incomplete_items?
		self.todo_items.incomplete.present?
	end
end
