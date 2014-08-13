class Concert < ActiveRecord::Base
	has_many :expenses
	has_many :incomes

	validates_presence_of :headliner, :venue, :date

	def profit
		Income.concert_total(self) - Expense.concert_total(self)
	end
end