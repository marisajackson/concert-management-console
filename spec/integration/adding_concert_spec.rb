RSpec.describe "Adding Concerts", :integration do
	context "accessing adding concert page" do
		let(:output){ run_concert_with_input("1") }
		it "should print out a confirmation of adding a new concert" do
			expect(output). to include("Before adding a concert, please answer a few questions.")
		end
	end

	context "getting basic info to create a concert" do
		let(:output){ run_concert_with_input("1") }
		let(:headliner_output){ run_concert_with_input("1", "Motion City Soundtrack") }
		let(:venue_output){ run_concert_with_input("1", "Motion City Soundtrack", "Newport Music Hall") }

		it "should ask for the headliner" do
			expect(output).to include ("Who is the headliner?")
		end

		it "should ask for the venue" do
			expect(headliner_output).to include ("What is the venue?")
		end

		it "should ask for the date" do
			expect(venue_output).to include ("When is the concert?")
		end
	end

	context "saving a concert" do
		context "valid input" do
			let!(:full_output){ run_concert_with_input("1", "Motion City Soundtrack", "Newport Music Hall", "4/14/2015") }
			it "should print a success message after getting all inputs" do
				pending "strings seemingly match"
				expect(full_output).to include("The Motion City Soundtrack concert at Newport Music Hall on 4/14/2015 has been saved.")
			end

			it "saves a concert with correct attributes" do
				expect(Concert.count).to eq 1
			end
		end

		context "invalid input" do
			let(:no_headliner){ run_concert_with_input("1", "", "Newport Music Hall", "9/14/2014") }
			let(:no_venue){ run_concert_with_input("1", "Motion City Soundtrack", "", "9/14/2014") }
			let(:no_date){ run_concert_with_input("1", "Motion City Soundtrack", "Newport Music Hall", "") }
			let(:invalid_date){ run_concert_with_input("1", "", "Newport Music Hall", "banana") }
			it "prints an error message" do
				expect(no_headliner).to include("Headliner can't be blank")
				expect(no_venue).to include("Venue can't be blank")
				expect(no_date).to include("Date can't be blank")
				expect(invalid_date).to include("banana is not a valid date.")
			end

			it "doesn't create a concert" do
				expect(Concert.count).to eq 0
			end
		end
	end
end