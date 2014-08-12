RSpec.describe Income do
	context "validations" do
		it { should validate_presence_of :name }
		it { should validate_presence_of :amount }
		it { should validate_presence_of :concert }
	end
end