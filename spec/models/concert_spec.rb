RSpec.describe Concert do
	context "validations" do
		it { should validate_presence_of :headliner }
		it { should validate_presence_of :venue }
		it { should validate_presence_of :date }
	end
end