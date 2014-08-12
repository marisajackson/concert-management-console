RSpec.describe "Viewing the Expenses menu", :integration do
	let(:output){ run_concert_with_input('2', '2', '1') } # 2 => View List, Second Concert, Expenses
	let!(:concert1){ Concert.create!(headliner: "MC Chris", venue: "Hoosier Dome", date: DateTime.strptime('09/24/2014', '%m/%d/%Y')) }
	let!(:concert2){ Concert.create!(headliner: "Dethklok", venue: "House of Blues", date: DateTime.strptime('10/03/2014', '%m/%d/%Y')) }

	context "expenses exists for concert" do
		before do
			Expense.create!(name: "talent", amount: 1000, concert: concert2)
			Expense.create!(name: "staff", amount: 500, concert: concert2)
		end
		
		it "should show list of current expenses" do
			expected = "1. Talent: $1000\n" +
								 "2. Staff: $500"

			expect(output).to include(expected)
		end

		it "should show expense total" do 
			expect(output).to include("Total: $1500")
		end

		it "should prompt the option of adding or editing expenses" do
			expect(output).to include("Type 'add' if you would like to add an expense.")
		end
	end

	context "expenses do not exists for concert" do
		it "should show an informative message" do
			expect(output).to include("There are currently no expenses.")
		end

		it "should prompt the option of adding expenses" do
			expect(output).to include("Type 'add' if you would like to add an expense.")
		end
	end

end