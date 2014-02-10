class TodoItem < ActiveRecord::Base
  belongs_to :todo

  validates :content, presence: true,
  					  length: { minimum: 2 }

 	class TodoItem < ActiveRecord::Base
  	scope :complete, -> { where("completed_at is not null") }
  	scope :incomplete, -> { where(completed_at: nil) }
	end

  def completed?
  	!completed_at.blank?
  end
end
