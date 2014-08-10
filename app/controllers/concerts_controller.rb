class ConcertsController

	def self.add
		puts "Before adding a concert, please answer a few questions."
		puts "Who is the headliner?"
		headliner = clean_gets
		puts "What is the venue?"
		venue = clean_gets
		puts "When is the concert?"
		date = clean_gets
		if date =~ /\A\d{1,2}[\/]\d{2}[\/]\d{4}\Z/
			date = DateTime.strptime(date, '%m/%d/%Y')
		else
			puts "#{date} is not a valid date."
		end
		concert = Concert.create(headliner: headliner, venue: venue, date: date)
		if concert.new_record?
			puts concert.errors.full_messages
		else
			puts "The #{headliner} concert at #{venue} on #{date.strftime('%m/%d/%Y')} has been saved."
		end
	end

end