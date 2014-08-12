class IncomesController

	def self.view(concert)
		total = 0;
		puts "======"
		puts "INCOME"
		puts "======"
		if concert.incomes.empty?
			puts "There is currently no income."
		else
			concert.incomes.each_with_index do	|income, index|
				puts "#{index + 1}. #{income.name.capitalize}: $#{income.amount}"
				total = Income.concert_total(concert)
			end
			puts "Total: $#{total}"
		end
		puts "Type 'add' if you would like to add an income."
		# Router.navigate_incomes_menu(concert)
	end

end