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


end