class Concert < ActiveRecord::Base
	validates_presence_of :headliner, :venue, :date
end