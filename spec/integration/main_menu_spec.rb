RSpec.describe "Concert Main Menu", :integration do
	context "Prints a menu" do
		let(:output){ run_concert_with_input }
		it "should show menu options" do
			expected = "1. Add New Concert\n" +
								 "2. View Concerts\n" +
							 	 "3. View Totals"
			expect(output).to include(expected)
		end
	end
end