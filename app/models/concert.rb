class Concert < ActiveRecord::Base
	has_many :expenses
	has_many :incomes

	validates_presence_of :headliner, :venue, :date
end