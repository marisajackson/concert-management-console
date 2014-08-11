class ConcertsController

	def self.add
		puts "Before adding a concert, please answer a few questions."
		puts "Who is the headliner?"
		headliner = clean_gets
		puts "What is the venue?"
		venue = clean_gets
		puts "When is the concert?"
		date = clean_gets
		if date =~ /\A\d{1,2}[\/]\d{1,2}[\/]\d{4}\Z/
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

	def self.list
		puts "========"
		puts "CONCERTS"
		puts "========"
		# puts "The concerts are #{self.concerts}"
		# puts self.concerts
		# puts "the last concerts is #{Concert.last}"
		# puts "after"
		if self.concerts.empty?
			puts "There are currently no concerts."
		else
			self.concerts.each_with_index do	|concert, index|
				puts "#{index + 1}. #{concert.headliner} / #{concert.venue} / #{concert.date.strftime('%m/%d/%Y')}"
			end
		end
	end

	def self.concerts
		concerts ||= Concert.all
	end
end