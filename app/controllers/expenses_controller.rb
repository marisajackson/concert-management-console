class ExpensesController

	def self.view(concert)
		total = 0;
		puts "========"
		puts "EXPENSES"
		puts "========"
		if concert.expenses.empty?
			puts "There are currently no expenses."
		else
			concert.expenses.each_with_index do	|expense, index|
				puts "#{index + 1}. #{expense.name.capitalize}: $#{expense.amount}"
				total = Expense.concert_total(concert)
			end
			puts "Total: $#{total}"
		end
		puts "Type 'add' if you would like to add an expense."
	end

end