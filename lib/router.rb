class Router
	def self.navigate_main_menu
		command = clean_gets
		case command
		when "1"
			ConcertsController.add
		when "2"
			ConcertsController.list
		else
			puts "I don't know the '#{command}' command."
		end
	end

	def self.navigate_concert_list
		command = clean_gets
		case command
		when /\d+/
			ConcertsController.view(command.to_i)
		else
			puts "I don't know the '#{command}' command."
		end
	end

	def self.navigate_finance_menu(concert)
		command = clean_gets
		case command
		when "1"
			ExpensesController.view(concert)
		end

	end

end