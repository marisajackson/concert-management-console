class IncomesController

	def self.add(concert)
		puts "You are now adding an income to the #{concert.headliner} concert."
		puts "What type of income would you like to add?"
		name = clean_gets
		puts "What is the income amount?"
		amount = clean_gets
		income = Income.create(name: name, amount: amount.to_i, concert: concert)
		if income.new_record?
			puts income.errors.full_messages
		else
			puts "The #{name} income has been added to the #{concert.headliner} concert in the amount of $#{amount}."
		end
	end

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
		Router.navigate_incomes_menu(concert)
	end

end