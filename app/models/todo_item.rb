class TodoItem < ActiveRecord::Base
  belongs_to :todo

  validates :content, presence: true,
  					  length: { minimum: 2 }
end
