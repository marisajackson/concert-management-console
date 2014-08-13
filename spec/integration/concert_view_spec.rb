RSpec.describe "Viewing an individual concert", :integration do
	before do
		Concert.create(headliner: "The Rocket Summer", venue: "Bogarts", date: DateTime.strptime('03/24/2015', '%m/%d/%Y'))
		concert2 = Concert.create(headliner: "MC Chris", venue: "Hoosier Dome", date: DateTime.strptime('09/24/2014', '%m/%d/%Y'))
		Concert.create(headliner: "Dethklok", venue: "House of Blues", date: DateTime.strptime('10/03/2014', '%m/%d/%Y'))
		Expense.create(name: "talent", amount: 1000, concert: concert2)
		Expense.create(name: "staff", amount: 500, concert: concert2)
		Income.create(name: "ticket sales", amount: 2000, concert: concert2)
		Income.create(name: "alcohol sales", amount: 3000, concert: concert2)
	end

	context "a concert that is in the list" do
		let(:output){ run_concert_with_input('2', '2')} # View List => MC Chris

		it "should include headliner for the concert" do
			expect(output).to include("Headliner: MC Chris")
		end

		it "should include the venue for the concert" do
			expect(output).to include("Venue: Hoosier Dome")
		end

		it "should include date for the concert" do
			expect(output).to include("Date: 09/24/2014")
		end

		it "should include the profit for the concert" do
			expect(output).to include("Profit: $3500")
		end

		it "should include finances menu" do
			expected = "========\n" +
								 "FINANCES\n" +
								 "========\n" +
								 "1. Expenses\n" +
								 "2. Income"
			expect(output).to include(expected)
		end
	end

	context "a concert that doesn't exist" do
		let(:output){ run_concert_with_input('2', '4') }
		it "prints an error message" do
			expect(output).to include("Sorry, that concert doesn't exist.")
		end
	end
end