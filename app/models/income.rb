class Income < ActiveRecord::Base
	belongs_to :concert

	validates_presence_of :name, :amount, :concert
	validates_numericality_of :amount, greater_than: 0, message: "must be an integer greater than 0"

	def self.concert_total(concert)
		total = 0
		concert.incomes.each do |income|
			total += income.amount
		end
		total
	end

end