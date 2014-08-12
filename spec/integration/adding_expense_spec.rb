RSpec.describe "Adding expenses to a concert", :integration do

	before do
		Concert.create(headliner: "The Rocket Summer", venue: "Bogarts", date: DateTime.strptime('03/24/2015', '%m/%d/%Y'))
		Concert.create(headliner: "MC Chris", venue: "Hoosier Dome", date: DateTime.strptime('09/24/2014', '%m/%d/%Y'))
		Concert.create(headliner: "Dethklok", venue: "House of Blues", date: DateTime.strptime('10/03/2014', '%m/%d/%Y'))
	end

	context "accessing adding expense screen" do 
		let(:output){ run_concert_with_input("2", "2", "1","add") } # Concert List => MC Chris => Add Expense
		it "should print out a confirmation of adding a new expense" do
			expect(output).to include("You are now adding an expense to the MC Chris concert.")
		end
	end

	context "getting info for creating an expense" do
		let(:output1){ run_concert_with_input("2", "2", "1","add") } # Concert List => MC Chris => Add Expense
		let(:output2){ run_concert_with_input("2", "2", "1","add", "Staff") } # Concert List => MC Chris => Add Expense
		it "should ask for the name of the expense" do
			expect(output1).to include("What type of expense would you like to add?")
		end

		it "should ask the amount of the expense" do
			expect(output2).to include("What is the expense amount?")
		end
	end

	context "saving an expense" do
		context "valid input" do
			let!(:output){ run_concert_with_input("2", "2", "1","add", "Staff", "500") } # Concert List => MC Chris => Add Expense called Staff for 500$
			it "should print a success message after getting all inputs" do
				expect(output).to include("The Staff expense has been added to the MC Chris concert in the amount of $500.")
			end

			it "saves a concert" do
				expect(Expense.count).to eq 1
			end

			it "should return last saved expense" do
				expect(Expense.last.name).to include("Staff")
			end

			it "should save under the correct concert" do
				expect(Expense.last.concert.headliner).to include("MC Chris")
			end
		end

		context "invalid input" do
			let(:no_name){ run_concert_with_input("2", "2", "1","add", "", "500") }
			let(:invalid_amount){ run_concert_with_input("2", "2", "1","add", "Staff", "banana") }
			it "prints an error message" do
				expect(no_name).to include("Name can't be blank")
				expect(invalid_amount).to include("must be an integer greater than 0")
			end

			it "doesn't create a expense" do
				expect(Expense.count).to eq 0
			end
		end
	end

end