class ExpensesController

	def self.add(concert)
		puts "You are now adding an expense to the #{concert.headliner} concert."
		puts "What type of expense would you like to add?"
		name = clean_gets
		puts "What is the expense amount?"
		amount = clean_gets
		expense = Expense.create(name: name, amount: amount.to_i, concert: concert)
		if expense.new_record?
			puts expense.errors.full_messages
		else
			puts "The #{name} expense has been added to the #{concert.headliner} concert in the amount of $#{amount}."
		end
	end

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
		Router.navigate_expenses_menu(concert)
	end



end