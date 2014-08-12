class Concert < ActiveRecord::Base
	has_many :expenses

	validates_presence_of :headliner, :venue, :date
end