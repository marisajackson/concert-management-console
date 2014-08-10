RSpec.describe "Concert Main Menu", :integration do
	context "Prints a menu" do
		it "should show menu options" do
			actual = `./concert`
			expected = "1. Add New Concert\n" +
								 "2. View Concerts\n" +
							 	 "3. View Totals"
			expect(actual).to include(expected)
		end
	end
end