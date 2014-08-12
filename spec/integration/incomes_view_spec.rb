RSpec.describe "Viewing the Income menu", :integration do
	let(:output){ run_concert_with_input('2', '2', '2') } # 2 => View List, Second Concert, Expenses
	let!(:concert1){ Concert.create!(headliner: "MC Chris", venue: "Hoosier Dome", date: DateTime.strptime('09/24/2014', '%m/%d/%Y')) }
	let!(:concert2){ Concert.create!(headliner: "Dethklok", venue: "House of Blues", date: DateTime.strptime('10/03/2014', '%m/%d/%Y')) }

	context "incomes exists for concert" do
		before do
			Income.create(name: "ticket sales", amount: 2000, concert: concert2)
			Income.create(name: "alcohol sales", amount: 3000, concert: concert2)
		end

		it "should show list of current income" do
			expected = "1. Ticket sales: $2000\n" +
								 "2. Alcohol sales: $3000"

			expect(output).to include(expected)
		end

		it "should show expense total" do 
			expect(output).to include("Total: $5000")
		end

		it "should prompt the option of adding or editing income" do
			expect(output).to include("Type 'add' if you would like to add an income.")
		end
	end

	context "income do not exists for concert" do
		it "should show an informative message" do
			expect(output).to include("There is currently no income.")
		end

		it "should prompt the option of adding income" do
			expect(output).to include("Type 'add' if you would like to add an income.")
		end
	end

end