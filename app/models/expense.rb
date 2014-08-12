class Expense < ActiveRecord::Base
	belongs_to :concert

	validates_presence_of :name, :amount, :concert

	def self.concert_total(concert)
		total = 0
		concert.expenses.each do |expense|
			total += expense.amount
		end
		total
	end
end