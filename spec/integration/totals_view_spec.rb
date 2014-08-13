RSpec.describe "View complete totals", :integration do
	let(:output){ run_concert_with_input("3") }
	context "with saved concerts" do

		before do
			concert1 = Concert.create(headliner: "The Rocket Summer", venue: "Bogarts", date: DateTime.strptime('03/24/2015', '%m/%d/%Y'))
			concert2 = Concert.create(headliner: "MC Chris", venue: "Hoosier Dome", date: DateTime.strptime('09/24/2014', '%m/%d/%Y'))
			Concert.create(headliner: "Dethklok", venue: "House of Blues", date: DateTime.strptime('10/03/2014', '%m/%d/%Y'))
			Expense.create(name: "talent", amount: 1000, concert: concert2)
			Expense.create(name: "staff", amount: 500, concert: concert1)
			Income.create(name: "ticket sales", amount: 2000, concert: concert2)
			Income.create(name: "alcohol sales", amount: 3000, concert: concert1)
		end

		it "should print out list of concerts" do
			expected = "Expenses: $1500\n" +
								 "Income: $5000\n" +
								 "Profit: $3500"
			expect(output).to include(expected)
		end
	end
end