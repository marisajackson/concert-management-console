class CreateExpenses < ActiveRecord::Migration
	def change
		create_table :expenses do |t|
			t.string :name
			t.integer :amount
			t.references :concert
		end
	end
end