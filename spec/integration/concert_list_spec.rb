RSpec.describe "Viewing concert list", :integration do
	let(:output){ run_concert_with_input("2") }
	context "with saved concerts" do

		before do
			Concert.create(headliner: "The Rocket Summer", venue: "Bogarts", date: DateTime.strptime('03/24/2015', '%m/%d/%Y'))
			Concert.create(headliner: "MC Chris", venue: "Hoosier Dome", date: DateTime.strptime('09/24/2014', '%m/%d/%Y'))
			Concert.create(headliner: "Dethklok", venue: "House of Blues", date: DateTime.strptime('10/03/2014', '%m/%d/%Y'))
		end

		it "should print out list of concerts" do
			expected = "1. The Rocket Summer / Bogarts / 03/24/2015\n" +
								 "2. MC Chris / Hoosier Dome / 09/24/2014\n" +
								 "3. Dethklok / House of Blues / 10/03/2014"
			expect(output).to include(expected)
		end

		it "should have a count of 3" do
			output
			expect(Concert.count).to eq 3
		end
	end

	context "with no saved concerts" do 
		it "should print out a message that there are no concerts" do
			expect(output).to include("There are currently no concerts.")
		end
	end
end