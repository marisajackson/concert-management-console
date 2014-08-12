RSpec.describe "Adding incomes to a concert", :integration do

	before do
		Concert.create(headliner: "The Rocket Summer", venue: "Bogarts", date: DateTime.strptime('03/24/2015', '%m/%d/%Y'))
		Concert.create(headliner: "MC Chris", venue: "Hoosier Dome", date: DateTime.strptime('09/24/2014', '%m/%d/%Y'))
		Concert.create(headliner: "Dethklok", venue: "House of Blues", date: DateTime.strptime('10/03/2014', '%m/%d/%Y'))
	end

	context "accessing adding income screen" do 
		let(:output){ run_concert_with_input("2", "1", "2", "add") } # Concert List => MC Chris => Add Expense
		it "should print out a confirmation of adding a new income" do
			expect(output).to include("You are now adding an income to the The Rocket Summer concert.")
		end
	end

	context "getting info for creating an income" do
		let(:output1){ run_concert_with_input("2", "1", "2", "add") } # Concert List => MC Chris => Add Expense
		let(:output2){ run_concert_with_input("2", "1", "2", "add", "Staff") } # Concert List => MC Chris => Add Expense
		it "should ask for the name of the income" do
			expect(output1).to include("What type of income would you like to add?")
		end

		it "should ask the amount of the income" do
			expect(output2).to include("What is the income amount?")
		end
	end

	context "saving an income" do
		context "valid input" do
			let!(:output){ run_concert_with_input("2", "1", "2", "add", "Staff", "500") } # Concert List => MC Chris => Add Expense called Staff for 500$
			it "should print a success message after getting all inputs" do
				expect(output).to include("The Staff income has been added to the The Rocket Summer concert in the amount of $500.")
			end

			it "saves a concert" do
				expect(Income.count).to eq 1
			end

			it "should return last saved income" do
				expect(Income.last.name).to include("Staff")
			end

			it "should save under the correct concert" do
				expect(Income.last.concert.headliner).to include("The Rocket Summer")
			end
		end

		context "invalid input" do
			let(:no_name){ run_concert_with_input("2", "1", "2", "add", "", "500") }
			let(:invalid_amount){ run_concert_with_input("2", "1", "2", "add", "Staff", "banana") }
			it "prints an error message" do
				expect(no_name).to include("Name can't be blank")
				expect(invalid_amount).to include("must be an integer greater than 0")
			end

			it "doesn't create a income" do
				expect(Income.count).to eq 0
			end
		end
	end

end